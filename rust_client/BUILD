load("@rules_rust//rust:defs.bzl", "rust_binary")
load("@rules_rust//proto:toolchain.bzl", "rust_proto_toolchain")

rust_proto_toolchain(
    name = "proto-toolchain-impl",
    edition = "2021",
    grpc_compile_deps = [
        "//rust_client/cargo:protobuf",
        "//rust_client/cargo:grpc",
        "//rust_client/cargo:tls_api",
        "//rust_client/cargo:tls_api_stub",
    ],
    #proto_plugin = "//rust_client/cargo:protobuf_codegen",
    grpc_plugin = "//rust_client/cargo:grpc_compiler",
    proto_compile_deps = [
        "//rust_client/cargo:protobuf",
    ],
    proto_plugin = "//rust_client/cargo:cargo_bin_protoc_gen_rust",
)

toolchain(
    name = "proto-toolchain",
    toolchain = ":proto-toolchain-impl",
    toolchain_type = "@rules_rust//proto:toolchain_type",
)

rust_binary(
    name = "hello_world",
    srcs = ["src/main.rs"],
    deps = [
        "//pbtypes:world_sync_rust",
        "//rust_client/src/connection:connect",
        "//rust_client/src/protocol_v1",
    ],
)
