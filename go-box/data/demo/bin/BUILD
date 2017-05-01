## BUILD

  package(
    default_visibility = ["//visibility:public"],
  )

  load("//go:def.bzl", "go_binary")

  go_binary(
    name = "bin",
    srcs = ["bin.go"],
    deps = [
      "//examples/lib:go_default_library",
    ],
  )

## *EOF*
