# Code generated by list_repository_tools_srcs.go; DO NOT EDIT.
# regenerate with `go run internal/list_repository_tools_srcs.go -dir $PWD -generate internal/go_repository_tools_srcs.bzl`
GO_REPOSITORY_TOOLS_SRCS = [
	"@bazel_gazelle//:BUILD.bazel",
	"@bazel_gazelle//cmd:BUILD.bazel",
	"@bazel_gazelle//cmd/autogazelle:BUILD.bazel",
	"@bazel_gazelle//cmd/autogazelle:autogazelle.go",
	"@bazel_gazelle//cmd/autogazelle:client_unix.go",
	"@bazel_gazelle//cmd/autogazelle:server_unix.go",
	"@bazel_gazelle//cmd/fetch_repo:BUILD.bazel",
	"@bazel_gazelle//cmd/fetch_repo:fetch_repo.go",
	"@bazel_gazelle//cmd/fetch_repo:module.go",
	"@bazel_gazelle//cmd/fetch_repo:vcs.go",
	"@bazel_gazelle//cmd/gazelle:BUILD.bazel",
	"@bazel_gazelle//cmd/gazelle:diff.go",
	"@bazel_gazelle//cmd/gazelle:fix-update.go",
	"@bazel_gazelle//cmd/gazelle:fix.go",
	"@bazel_gazelle//cmd/gazelle:gazelle.go",
	"@bazel_gazelle//cmd/gazelle:langs.go",
	"@bazel_gazelle//cmd/gazelle:metaresolver.go",
	"@bazel_gazelle//cmd/gazelle:print.go",
	"@bazel_gazelle//cmd/gazelle:update-repos.go",
	"@bazel_gazelle//cmd/generate_repo_config:BUILD.bazel",
	"@bazel_gazelle//cmd/generate_repo_config:generate_repo_config.go",
	"@bazel_gazelle//cmd/move_labels:BUILD.bazel",
	"@bazel_gazelle//cmd/move_labels:move_labels.go",
	"@bazel_gazelle//config:BUILD.bazel",
	"@bazel_gazelle//config:config.go",
	"@bazel_gazelle//config:constants.go",
	"@bazel_gazelle//flag:BUILD.bazel",
	"@bazel_gazelle//flag:flag.go",
	"@bazel_gazelle//internal:BUILD.bazel",
	"@bazel_gazelle//internal/gazellebinarytest:BUILD.bazel",
	"@bazel_gazelle//internal/gazellebinarytest:xlang.go",
	"@bazel_gazelle//internal/generationtest:BUILD.bazel",
	"@bazel_gazelle//internal/language:BUILD.bazel",
	"@bazel_gazelle//internal/language/test_filegroup:BUILD.bazel",
	"@bazel_gazelle//internal/language/test_filegroup:lang.go",
	"@bazel_gazelle//internal:list_repository_tools_srcs.go",
	"@bazel_gazelle//internal/version:BUILD.bazel",
	"@bazel_gazelle//internal/version:version.go",
	"@bazel_gazelle//internal/wspace:BUILD.bazel",
	"@bazel_gazelle//internal/wspace:finder.go",
	"@bazel_gazelle//label:BUILD.bazel",
	"@bazel_gazelle//label:label.go",
	"@bazel_gazelle//label:pattern.go",
	"@bazel_gazelle//language:BUILD.bazel",
	"@bazel_gazelle//language/go:BUILD.bazel",
	"@bazel_gazelle//language/go:config.go",
	"@bazel_gazelle//language/go:constants.go",
	"@bazel_gazelle//language/go:dep.go",
	"@bazel_gazelle//language/go:embed.go",
	"@bazel_gazelle//language/go:fileinfo.go",
	"@bazel_gazelle//language/go:fix.go",
	"@bazel_gazelle//language/go/gen_std_package_list:BUILD.bazel",
	"@bazel_gazelle//language/go/gen_std_package_list:gen_std_package_list.go",
	"@bazel_gazelle//language/go:generate.go",
	"@bazel_gazelle//language/go:godep.go",
	"@bazel_gazelle//language/go:kinds.go",
	"@bazel_gazelle//language/go:lang.go",
	"@bazel_gazelle//language/go:modules.go",
	"@bazel_gazelle//language/go:package.go",
	"@bazel_gazelle//language/go:resolve.go",
	"@bazel_gazelle//language/go:std_package_list.go",
	"@bazel_gazelle//language/go:update.go",
	"@bazel_gazelle//language:lang.go",
	"@bazel_gazelle//language/proto:BUILD.bazel",
	"@bazel_gazelle//language/proto:config.go",
	"@bazel_gazelle//language/proto:constants.go",
	"@bazel_gazelle//language/proto:fileinfo.go",
	"@bazel_gazelle//language/proto:fix.go",
	"@bazel_gazelle//language/proto/gen:BUILD.bazel",
	"@bazel_gazelle//language/proto/gen:gen_known_imports.go",
	"@bazel_gazelle//language/proto/gen:update_proto_csv.go",
	"@bazel_gazelle//language/proto:generate.go",
	"@bazel_gazelle//language/proto:kinds.go",
	"@bazel_gazelle//language/proto:known_go_imports.go",
	"@bazel_gazelle//language/proto:known_imports.go",
	"@bazel_gazelle//language/proto:known_proto_imports.go",
	"@bazel_gazelle//language/proto:lang.go",
	"@bazel_gazelle//language/proto:package.go",
	"@bazel_gazelle//language/proto:resolve.go",
	"@bazel_gazelle//language:update.go",
	"@bazel_gazelle//merger:BUILD.bazel",
	"@bazel_gazelle//merger:fix.go",
	"@bazel_gazelle//merger:merger.go",
	"@bazel_gazelle//pathtools:BUILD.bazel",
	"@bazel_gazelle//pathtools:path.go",
	"@bazel_gazelle//repo:BUILD.bazel",
	"@bazel_gazelle//repo:remote.go",
	"@bazel_gazelle//repo:repo.go",
	"@bazel_gazelle//resolve:BUILD.bazel",
	"@bazel_gazelle//resolve:config.go",
	"@bazel_gazelle//resolve:index.go",
	"@bazel_gazelle//rule:BUILD.bazel",
	"@bazel_gazelle//rule:directives.go",
	"@bazel_gazelle//rule:expr.go",
	"@bazel_gazelle//rule:merge.go",
	"@bazel_gazelle//rule:platform.go",
	"@bazel_gazelle//rule:platform_strings.go",
	"@bazel_gazelle//rule:rule.go",
	"@bazel_gazelle//rule:sort_labels.go",
	"@bazel_gazelle//rule:types.go",
	"@bazel_gazelle//rule:value.go",
	"@bazel_gazelle//testtools:BUILD.bazel",
	"@bazel_gazelle//testtools:config.go",
	"@bazel_gazelle//testtools:files.go",
	"@bazel_gazelle//walk:BUILD.bazel",
	"@bazel_gazelle//walk:config.go",
	"@bazel_gazelle//walk:walk.go",
]
