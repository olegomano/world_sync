"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def rust_client_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "rust_client__autocfg__1_1_0",
        url = "https://crates.io/api/v1/crates/autocfg/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "autocfg-1.1.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.autocfg-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__base64__0_9_3",
        url = "https://crates.io/api/v1/crates/base64/0.9.3/download",
        type = "tar.gz",
        strip_prefix = "base64-0.9.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.base64-0.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__bytes__0_4_12",
        url = "https://crates.io/api/v1/crates/bytes/0.4.12/download",
        type = "tar.gz",
        strip_prefix = "bytes-0.4.12",
        build_file = Label("//rust_client/cargo/remote:BUILD.bytes-0.4.12.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//rust_client/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__cloudabi__0_0_3",
        url = "https://crates.io/api/v1/crates/cloudabi/0.0.3/download",
        type = "tar.gz",
        strip_prefix = "cloudabi-0.0.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.cloudabi-0.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__crossbeam_deque__0_7_4",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.7.4/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-deque-0.7.4",
        build_file = Label("//rust_client/cargo/remote:BUILD.crossbeam-deque-0.7.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__crossbeam_epoch__0_8_2",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.8.2/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-epoch-0.8.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.crossbeam-epoch-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__crossbeam_queue__0_2_3",
        url = "https://crates.io/api/v1/crates/crossbeam-queue/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-queue-0.2.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.crossbeam-queue-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__crossbeam_utils__0_7_2",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.7.2/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-utils-0.7.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.crossbeam-utils-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__fnv__1_0_7",
        url = "https://crates.io/api/v1/crates/fnv/1.0.7/download",
        type = "tar.gz",
        strip_prefix = "fnv-1.0.7",
        build_file = Label("//rust_client/cargo/remote:BUILD.fnv-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__fuchsia_zircon__0_3_3",
        url = "https://crates.io/api/v1/crates/fuchsia-zircon/0.3.3/download",
        type = "tar.gz",
        strip_prefix = "fuchsia-zircon-0.3.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.fuchsia-zircon-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__fuchsia_zircon_sys__0_3_3",
        url = "https://crates.io/api/v1/crates/fuchsia-zircon-sys/0.3.3/download",
        type = "tar.gz",
        strip_prefix = "fuchsia-zircon-sys-0.3.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.fuchsia-zircon-sys-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__futures__0_1_31",
        url = "https://crates.io/api/v1/crates/futures/0.1.31/download",
        type = "tar.gz",
        strip_prefix = "futures-0.1.31",
        build_file = Label("//rust_client/cargo/remote:BUILD.futures-0.1.31.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__futures_cpupool__0_1_8",
        url = "https://crates.io/api/v1/crates/futures-cpupool/0.1.8/download",
        type = "tar.gz",
        strip_prefix = "futures-cpupool-0.1.8",
        build_file = Label("//rust_client/cargo/remote:BUILD.futures-cpupool-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__grpc__0_6_2",
        url = "https://crates.io/api/v1/crates/grpc/0.6.2/download",
        type = "tar.gz",
        strip_prefix = "grpc-0.6.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.grpc-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__grpc_compiler__0_6_2",
        url = "https://crates.io/api/v1/crates/grpc-compiler/0.6.2/download",
        type = "tar.gz",
        strip_prefix = "grpc-compiler-0.6.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.grpc-compiler-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__hermit_abi__0_2_6",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.2.6/download",
        type = "tar.gz",
        strip_prefix = "hermit-abi-0.2.6",
        build_file = Label("//rust_client/cargo/remote:BUILD.hermit-abi-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__httpbis__0_7_0",
        url = "https://crates.io/api/v1/crates/httpbis/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "httpbis-0.7.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.httpbis-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__iovec__0_1_4",
        url = "https://crates.io/api/v1/crates/iovec/0.1.4/download",
        type = "tar.gz",
        strip_prefix = "iovec-0.1.4",
        build_file = Label("//rust_client/cargo/remote:BUILD.iovec-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__kernel32_sys__0_2_2",
        url = "https://crates.io/api/v1/crates/kernel32-sys/0.2.2/download",
        type = "tar.gz",
        strip_prefix = "kernel32-sys-0.2.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.kernel32-sys-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__libc__0_2_140",
        url = "https://crates.io/api/v1/crates/libc/0.2.140/download",
        type = "tar.gz",
        strip_prefix = "libc-0.2.140",
        build_file = Label("//rust_client/cargo/remote:BUILD.libc-0.2.140.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__lock_api__0_3_4",
        url = "https://crates.io/api/v1/crates/lock_api/0.3.4/download",
        type = "tar.gz",
        strip_prefix = "lock_api-0.3.4",
        build_file = Label("//rust_client/cargo/remote:BUILD.lock_api-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__log__0_3_9",
        url = "https://crates.io/api/v1/crates/log/0.3.9/download",
        type = "tar.gz",
        strip_prefix = "log-0.3.9",
        build_file = Label("//rust_client/cargo/remote:BUILD.log-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__log__0_4_17",
        url = "https://crates.io/api/v1/crates/log/0.4.17/download",
        type = "tar.gz",
        strip_prefix = "log-0.4.17",
        build_file = Label("//rust_client/cargo/remote:BUILD.log-0.4.17.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__maybe_uninit__2_0_0",
        url = "https://crates.io/api/v1/crates/maybe-uninit/2.0.0/download",
        type = "tar.gz",
        strip_prefix = "maybe-uninit-2.0.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.maybe-uninit-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//rust_client/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__mio__0_6_23",
        url = "https://crates.io/api/v1/crates/mio/0.6.23/download",
        type = "tar.gz",
        strip_prefix = "mio-0.6.23",
        build_file = Label("//rust_client/cargo/remote:BUILD.mio-0.6.23.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__mio_uds__0_6_8",
        url = "https://crates.io/api/v1/crates/mio-uds/0.6.8/download",
        type = "tar.gz",
        strip_prefix = "mio-uds-0.6.8",
        build_file = Label("//rust_client/cargo/remote:BUILD.mio-uds-0.6.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__miow__0_2_2",
        url = "https://crates.io/api/v1/crates/miow/0.2.2/download",
        type = "tar.gz",
        strip_prefix = "miow-0.2.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.miow-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__net2__0_2_38",
        url = "https://crates.io/api/v1/crates/net2/0.2.38/download",
        type = "tar.gz",
        strip_prefix = "net2-0.2.38",
        build_file = Label("//rust_client/cargo/remote:BUILD.net2-0.2.38.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num__0_4_0",
        url = "https://crates.io/api/v1/crates/num/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "num-0.4.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_bigint__0_4_3",
        url = "https://crates.io/api/v1/crates/num-bigint/0.4.3/download",
        type = "tar.gz",
        strip_prefix = "num-bigint-0.4.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-bigint-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_complex__0_4_3",
        url = "https://crates.io/api/v1/crates/num-complex/0.4.3/download",
        type = "tar.gz",
        strip_prefix = "num-complex-0.4.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-complex-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_derive__0_3_3",
        url = "https://crates.io/api/v1/crates/num-derive/0.3.3/download",
        type = "tar.gz",
        strip_prefix = "num-derive-0.3.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-derive-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_integer__0_1_45",
        url = "https://crates.io/api/v1/crates/num-integer/0.1.45/download",
        type = "tar.gz",
        strip_prefix = "num-integer-0.1.45",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-integer-0.1.45.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_iter__0_1_43",
        url = "https://crates.io/api/v1/crates/num-iter/0.1.43/download",
        type = "tar.gz",
        strip_prefix = "num-iter-0.1.43",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-iter-0.1.43.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_rational__0_4_1",
        url = "https://crates.io/api/v1/crates/num-rational/0.4.1/download",
        type = "tar.gz",
        strip_prefix = "num-rational-0.4.1",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-rational-0.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_traits__0_2_15",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.15/download",
        type = "tar.gz",
        strip_prefix = "num-traits-0.2.15",
        build_file = Label("//rust_client/cargo/remote:BUILD.num-traits-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__num_cpus__1_15_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.15.0/download",
        type = "tar.gz",
        strip_prefix = "num_cpus-1.15.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.num_cpus-1.15.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__parking_lot__0_9_0",
        url = "https://crates.io/api/v1/crates/parking_lot/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "parking_lot-0.9.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.parking_lot-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__parking_lot_core__0_6_3",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.6.3/download",
        type = "tar.gz",
        strip_prefix = "parking_lot_core-0.6.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.parking_lot_core-0.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__proc_macro2__1_0_49",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.49/download",
        type = "tar.gz",
        sha256 = "57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5",
        strip_prefix = "proc-macro2-1.0.49",
        build_file = Label("//rust_client/cargo/remote:BUILD.proc-macro2-1.0.49.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__protobuf__2_8_2",
        url = "https://crates.io/api/v1/crates/protobuf/2.8.2/download",
        type = "tar.gz",
        strip_prefix = "protobuf-2.8.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.protobuf-2.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__protobuf_codegen__2_8_2",
        url = "https://crates.io/api/v1/crates/protobuf-codegen/2.8.2/download",
        type = "tar.gz",
        strip_prefix = "protobuf-codegen-2.8.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.protobuf-codegen-2.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__protoc_bin_vendored__2_27_3",
        url = "https://crates.io/api/v1/crates/protoc-bin-vendored/2.27.3/download",
        type = "tar.gz",
        strip_prefix = "protoc-bin-vendored-2.27.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.protoc-bin-vendored-2.27.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__quote__1_0_23",
        url = "https://crates.io/api/v1/crates/quote/1.0.23/download",
        type = "tar.gz",
        sha256 = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b",
        strip_prefix = "quote-1.0.23",
        build_file = Label("//rust_client/cargo/remote:BUILD.quote-1.0.23.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__redox_syscall__0_1_57",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.57/download",
        type = "tar.gz",
        strip_prefix = "redox_syscall-0.1.57",
        build_file = Label("//rust_client/cargo/remote:BUILD.redox_syscall-0.1.57.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__safemem__0_3_3",
        url = "https://crates.io/api/v1/crates/safemem/0.3.3/download",
        type = "tar.gz",
        strip_prefix = "safemem-0.3.3",
        build_file = Label("//rust_client/cargo/remote:BUILD.safemem-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__scoped_tls__0_1_2",
        url = "https://crates.io/api/v1/crates/scoped-tls/0.1.2/download",
        type = "tar.gz",
        strip_prefix = "scoped-tls-0.1.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.scoped-tls-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__slab__0_3_0",
        url = "https://crates.io/api/v1/crates/slab/0.3.0/download",
        type = "tar.gz",
        strip_prefix = "slab-0.3.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.slab-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__slab__0_4_8",
        url = "https://crates.io/api/v1/crates/slab/0.4.8/download",
        type = "tar.gz",
        strip_prefix = "slab-0.4.8",
        build_file = Label("//rust_client/cargo/remote:BUILD.slab-0.4.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__smallvec__0_6_14",
        url = "https://crates.io/api/v1/crates/smallvec/0.6.14/download",
        type = "tar.gz",
        strip_prefix = "smallvec-0.6.14",
        build_file = Label("//rust_client/cargo/remote:BUILD.smallvec-0.6.14.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__syn__1_0_107",
        url = "https://crates.io/api/v1/crates/syn/1.0.107/download",
        type = "tar.gz",
        sha256 = "1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5",
        strip_prefix = "syn-1.0.107",
        build_file = Label("//rust_client/cargo/remote:BUILD.syn-1.0.107.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tls_api__0_1_22",
        url = "https://crates.io/api/v1/crates/tls-api/0.1.22/download",
        type = "tar.gz",
        strip_prefix = "tls-api-0.1.22",
        build_file = Label("//rust_client/cargo/remote:BUILD.tls-api-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tls_api_stub__0_1_22",
        url = "https://crates.io/api/v1/crates/tls-api-stub/0.1.22/download",
        type = "tar.gz",
        strip_prefix = "tls-api-stub-0.1.22",
        build_file = Label("//rust_client/cargo/remote:BUILD.tls-api-stub-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio__0_1_22",
        url = "https://crates.io/api/v1/crates/tokio/0.1.22/download",
        type = "tar.gz",
        strip_prefix = "tokio-0.1.22",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_codec__0_1_2",
        url = "https://crates.io/api/v1/crates/tokio-codec/0.1.2/download",
        type = "tar.gz",
        strip_prefix = "tokio-codec-0.1.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-codec-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_core__0_1_18",
        url = "https://crates.io/api/v1/crates/tokio-core/0.1.18/download",
        type = "tar.gz",
        strip_prefix = "tokio-core-0.1.18",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-core-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_current_thread__0_1_7",
        url = "https://crates.io/api/v1/crates/tokio-current-thread/0.1.7/download",
        type = "tar.gz",
        strip_prefix = "tokio-current-thread-0.1.7",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-current-thread-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_executor__0_1_10",
        url = "https://crates.io/api/v1/crates/tokio-executor/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "tokio-executor-0.1.10",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-executor-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_fs__0_1_7",
        url = "https://crates.io/api/v1/crates/tokio-fs/0.1.7/download",
        type = "tar.gz",
        strip_prefix = "tokio-fs-0.1.7",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-fs-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_io__0_1_13",
        url = "https://crates.io/api/v1/crates/tokio-io/0.1.13/download",
        type = "tar.gz",
        strip_prefix = "tokio-io-0.1.13",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-io-0.1.13.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_reactor__0_1_12",
        url = "https://crates.io/api/v1/crates/tokio-reactor/0.1.12/download",
        type = "tar.gz",
        strip_prefix = "tokio-reactor-0.1.12",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-reactor-0.1.12.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_sync__0_1_8",
        url = "https://crates.io/api/v1/crates/tokio-sync/0.1.8/download",
        type = "tar.gz",
        strip_prefix = "tokio-sync-0.1.8",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-sync-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_tcp__0_1_4",
        url = "https://crates.io/api/v1/crates/tokio-tcp/0.1.4/download",
        type = "tar.gz",
        strip_prefix = "tokio-tcp-0.1.4",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-tcp-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_threadpool__0_1_18",
        url = "https://crates.io/api/v1/crates/tokio-threadpool/0.1.18/download",
        type = "tar.gz",
        strip_prefix = "tokio-threadpool-0.1.18",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-threadpool-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_timer__0_1_2",
        url = "https://crates.io/api/v1/crates/tokio-timer/0.1.2/download",
        type = "tar.gz",
        strip_prefix = "tokio-timer-0.1.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-timer-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_timer__0_2_13",
        url = "https://crates.io/api/v1/crates/tokio-timer/0.2.13/download",
        type = "tar.gz",
        strip_prefix = "tokio-timer-0.2.13",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-timer-0.2.13.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_tls_api__0_1_22",
        url = "https://crates.io/api/v1/crates/tokio-tls-api/0.1.22/download",
        type = "tar.gz",
        strip_prefix = "tokio-tls-api-0.1.22",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-tls-api-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_udp__0_1_6",
        url = "https://crates.io/api/v1/crates/tokio-udp/0.1.6/download",
        type = "tar.gz",
        strip_prefix = "tokio-udp-0.1.6",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-udp-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_uds__0_1_7",
        url = "https://crates.io/api/v1/crates/tokio-uds/0.1.7/download",
        type = "tar.gz",
        strip_prefix = "tokio-uds-0.1.7",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-uds-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__tokio_uds__0_2_7",
        url = "https://crates.io/api/v1/crates/tokio-uds/0.2.7/download",
        type = "tar.gz",
        strip_prefix = "tokio-uds-0.2.7",
        build_file = Label("//rust_client/cargo/remote:BUILD.tokio-uds-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__unicode_ident__1_0_6",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.6/download",
        type = "tar.gz",
        sha256 = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc",
        strip_prefix = "unicode-ident-1.0.6",
        build_file = Label("//rust_client/cargo/remote:BUILD.unicode-ident-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__unix_socket__0_5_0",
        url = "https://crates.io/api/v1/crates/unix_socket/0.5.0/download",
        type = "tar.gz",
        strip_prefix = "unix_socket-0.5.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.unix_socket-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__void__1_0_2",
        url = "https://crates.io/api/v1/crates/void/1.0.2/download",
        type = "tar.gz",
        strip_prefix = "void-1.0.2",
        build_file = Label("//rust_client/cargo/remote:BUILD.void-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__winapi__0_2_8",
        url = "https://crates.io/api/v1/crates/winapi/0.2.8/download",
        type = "tar.gz",
        strip_prefix = "winapi-0.2.8",
        build_file = Label("//rust_client/cargo/remote:BUILD.winapi-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//rust_client/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__winapi_build__0_1_1",
        url = "https://crates.io/api/v1/crates/winapi-build/0.1.1/download",
        type = "tar.gz",
        strip_prefix = "winapi-build-0.1.1",
        build_file = Label("//rust_client/cargo/remote:BUILD.winapi-build-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//rust_client/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rust_client__ws2_32_sys__0_2_1",
        url = "https://crates.io/api/v1/crates/ws2_32-sys/0.2.1/download",
        type = "tar.gz",
        strip_prefix = "ws2_32-sys-0.2.1",
        build_file = Label("//rust_client/cargo/remote:BUILD.ws2_32-sys-0.2.1.bazel"),
    )
