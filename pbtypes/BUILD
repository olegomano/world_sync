load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//proto:proto.bzl", "rust_proto_library")

proto_library(
    name = "world_sync",
    srcs = ["protocol.proto"],
    visibility = ["//visibility:public"],
)

rust_proto_library(
    name = "world_sync_rust",
    rust_deps = ["//rust_client/cargo:protobuf"],
    visibility = ["//visibility:public"],
    deps = [":world_sync"],
)

go_proto_library(
    name = "world_sync_go_proto",
    importpath = "multiplayer/pbtypes",
    proto = ":multiplayer_proto",
    visibility = ["//visibility:public"],
)

proto_library(
    name = "multiplayer_proto",
    srcs = [
        "protocol.proto",
        "test.proto",
    ],
    visibility = ["//visibility:public"],
)

go_library(
    name = "pbtypes",
    embed = [":world_sync_go_proto"],
    importpath = "multiplayer/pbtypes",
    visibility = ["//visibility:public"],
)
