load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//proto:proto.bzl", "rust_proto_library")

proto_library(
    name = "test_proto",
    srcs = ["test.proto"],
    visibility = ["//visibility:public"],
)

rust_proto_library(
    name = "test_proto_rust",
    visibility = ["//visibility:public"],
    deps = [":test_proto"],
)

go_proto_library(
    name = "test_go_proto",
    importpath = "multiplayer/pbtypes",
    proto = ":test_proto",
    visibility = ["//visibility:public"],
)

go_library(
    name = "pbtypes",
    embed = [":test_go_proto"],
    importpath = "multiplayer/pbtypes",
    visibility = ["//visibility:public"],
)

proto_library(
    name = "world_sync",
    srcs = ["protocol.proto"],
    visibility = ["//visibility:public"],
)

rust_proto_library(
    name = "world_sync_rust",
    visibility = ["//visibility:public"],
    deps = [":world_sync"],
)

go_proto_library(
    name = "world_sync_go_proto",
    importpath = "multiplayer/pbtypes",
    proto = ":world_sync",
    visibility = ["//visibility:public"],
)

go_library(
    name = "world_sync_pbtypes",
    embed = [":world_sync_go_proto"],
    importpath = "multiplayer/pbtypes",
    visibility = ["//visibility:public"],
)




