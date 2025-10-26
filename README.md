# Bazel rules for sqlc

This is a ruleset to use [sqlc](https://github.com/sqlc-dev/sqlc) with bazel.

## Installation

Clone this repo then add to your `MODULE.bazel`:

```starlark
bazel_dep(name = "regb_rules_sqlc", version = "0.0.0", dev_dependency = True)
local_path_override(
    module_name = "regb_rules_sqlc",
    path = PATH_TO_CLONE
)

sqlc = use_extension("@regb_rules_sqlc//sqlc:extensions.bzl", "sqlc")
sqlc.toolchain(sqlc_version = "1.30.0")
```

## Quick Start

With `go` and `postgres`:

```starlark
load("@regb_rules_sqlc//sqlc:defs.bzl", "sqlc_config", "sqlc_generate")
load("@rules_go//go:def.bzl", "go_library")

sqlc_config(
    name = "config",
    engine = "postgresql",
    package = "db",
    queries = [":query.sql"],
    schema = [":schema.sql"],
)

sqlc_generate(
    name = "generate",
    config = ":config",
)

go_library(
    name = "db",
    srcs = [":generate"],
    importpath = "MODULE_BASE/db",
    deps = [
        "@com_github_jackc_pgx_v5//:pgx",
        "@com_github_jackc_pgx_v5//pgtype",
        "@com_github_jackc_pgx_v5//pgconn",
    ],
)
```
