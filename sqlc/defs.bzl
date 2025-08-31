"Public API re-exports"

load("//sqlc/private:sqlc_config.bzl", _sqlc_config = "sqlc_config")
load("//sqlc/private:sqlc_generate.bzl", _sqlc_generate = "sqlc_generate")

sqlc_config = _sqlc_config
sqlc_generate = _sqlc_generate
