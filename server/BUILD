load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("@bazel_gazelle//:def.bzl", "gazelle")

gazelle(
    name = "gazelle",
    args = [
        "-go_prefix=multiplayer",
    ],
)

gazelle(
    name = "gazelle-update",
    args = [
        "-from_file=server/go.mod",
        "-to_macro=deps.bzl%go_dependencies",
        "-prune",
        "-build_file_proto_mode=disable_global",
    ],
    command = "update-repos",
)

go_library(
    name = "lib",
    srcs = ["main.go"],
    importpath = "",
    visibility = ["//visibility:private"],
)

go_binary(
    name = "server",
    embed = [":server_lib"],
    visibility = ["//visibility:public"],
)

go_library(
    name = "server_lib",
    srcs = ["main.go"],
    importpath = "multiplayer/server",
    visibility = ["//visibility:private"],
    deps = [
        "//server/connection_manager",
        "//server/http",
        "//server/tcp",
    ],
)
