load("@rules_rust//rust:defs.bzl", "rust_binary")

rust_binary(
    name = "hello_world",
    srcs = ["src/main.rs"],
    deps = [
        "//pbtypes:test_proto_rust",
        "//pbtypes:world_sync_rust",
        "//rust_client/src/connection:connect",
        "//rust_client/src/protocol_v1",
    ],
)
