load("@rules_go//go:def.bzl", "go_library")
load("@rules_sqlc//sqlc:defs.bzl", "sqlc_config", "sqlc_generate")

sqlc_config(
    name = "test-config",
    engine = "sqlite",
    package = "db",
    queries = [":query.sql"],
    schema = [":schema.sql"],
)

sqlc_generate(
    name = "test",
    config = ":test-config",
)

go_library(
    name = "db",
    srcs = [":test"],
    importpath = "github.com/regb/rules_sqlc/e2e/smoke/go-sqlite/db",
    visibility = ["//visibility:public"],
)
