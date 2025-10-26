# Bazel rules for sqlc

This is a ruleset to use [sqlc](https://github.com/sqlc-dev/sqlc) with bazel.

## Installation

Add this to your `MODULE.bazel`:

```starlark
bazel_dep(name = "rules_sqlc", dev_dependency = True)
archive_override(
    module_name = "rules_sqlc",
    urls = ["https://github.com/regb/rules_sqlc/archive/refs/heads/main.tar.gz"],
    strip_prefix = "rules_sqlc-main",
    # It is recommended to edit the above URL to a specific commit and the below sha256.
    # integrity = "sha256-...",
)


sqlc = use_extension("@rules_sqlc//sqlc:extensions.bzl", "sqlc")
sqlc.toolchain(sqlc_version = "1.30.0")
```

## Quick Start

With `go` and `postgres`:

```starlark
load("@rules_sqlc//sqlc:defs.bzl", "sqlc_config", "sqlc_generate")
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
