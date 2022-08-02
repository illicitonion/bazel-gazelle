/* Copyright 2022 The Bazel Authors. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Package test_filegroup_with_config generates an "all_files" filegroup target
// in each package. This target globs files in the same package and
// depends on subpackages.
//
// These rules are used for testing with go_bazel_test.
//
// This extension is experimental and subject to change. It is not included
// in the default Gazelle binary.
package test_filegroup_with_config

import (
	"path"
	"path/filepath"

	"github.com/bazelbuild/bazel-gazelle/config"
	"github.com/bazelbuild/bazel-gazelle/language"
	"github.com/bazelbuild/bazel-gazelle/rule"
)

const testFilegroupWithConfigName = "test_filegroup_with_config"

type testFilegroupLangWithConfig struct {
	language.BaseLang
}

func NewLanguage() language.Language {
	return &testFilegroupLangWithConfig{}
}

type fgConfigs map[string]*fgConfig

type fgConfig struct {
	parent            *fgConfig
	filegroupLoadFrom string
}

func (*testFilegroupLangWithConfig) Name() string { return testFilegroupWithConfigName }

func (b *testFilegroupLangWithConfig) KnownDirectives() []string {
	return []string{
		"filegroup_load_from",
	}
}

func (b *testFilegroupLangWithConfig) Configure(c *config.Config, rel string, f *rule.File) {
	if _, exists := c.Exts[testFilegroupWithConfigName]; !exists {
		c.Exts[testFilegroupWithConfigName] = fgConfigs{
			"": &fgConfig{},
		}
	}

	cfgs := c.Exts[testFilegroupWithConfigName].(fgConfigs)

	cfg, exists := cfgs[rel]
	if !exists {
		parent := cfgs[filepath.Dir(rel)]
		cfg = &fgConfig{
			parent: parent,
		}
		cfgs[rel] = cfg
	}

	for _, directive := range f.Directives {
		if directive.Key == "filegroup_load_from" {
			cfg.filegroupLoadFrom = directive.Value
		}
	}
}

func (*testFilegroupLangWithConfig) Kinds() map[string]rule.KindInfo {
	panic("Kinds should never be called - this language is configurable")
}

func (*testFilegroupLangWithConfig) Loads() []rule.LoadInfo {
	panic("Loads should never be called - this language is configurable")
}

func (*testFilegroupLangWithConfig) ConfigDependentKinds(*config.Config, *string) map[string]rule.KindInfo {
	return map[string]rule.KindInfo{
		"custom_filegroup": {
			NonEmptyAttrs:  map[string]bool{"srcs": true, "deps": true},
			MergeableAttrs: map[string]bool{"srcs": true},
		},
	}
}

func (*testFilegroupLangWithConfig) ConfigDependentLoads(c *config.Config, rel *string) []rule.LoadInfo {
	if rel == nil {
		return nil
	}

	var loads []rule.LoadInfo
	cfg := c.Exts[testFilegroupWithConfigName].(fgConfigs)[*rel]

	loadFrom := cfg.filegroupLoadFrom
	for loadFrom == "" {
		cfg = cfg.parent
		if cfg == nil {
			break
		} else {
			loadFrom = cfg.filegroupLoadFrom
		}
	}

	loads = append(loads, rule.LoadInfo{
		Name:    loadFrom,
		Symbols: []string{"custom_filegroup"},
	})
	return loads
}

func (*testFilegroupLangWithConfig) GenerateRules(args language.GenerateArgs) language.GenerateResult {
	r := rule.NewRule("custom_filegroup", "all_files")
	srcs := make([]string, 0, len(args.Subdirs)+len(args.RegularFiles))
	srcs = append(srcs, args.RegularFiles...)
	for _, f := range args.Subdirs {
		pkg := path.Join(args.Rel, f)
		srcs = append(srcs, "//"+pkg+":all_files")
	}
	r.SetAttr("srcs", srcs)
	r.SetAttr("testonly", true)
	if args.File == nil || !args.File.HasDefaultVisibility() {
		r.SetAttr("visibility", []string{"//visibility:public"})
	}
	return language.GenerateResult{
		Gen:     []*rule.Rule{r},
		Imports: []interface{}{nil},
	}
}
