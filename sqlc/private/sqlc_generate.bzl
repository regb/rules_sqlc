"""Rule to run sqlc generate"""

load("//sqlc/private:sqlc_config.bzl", "SqlcConfigInfo")

def _sqlc_generate_impl(ctx):
    toolchain = ctx.toolchains["//sqlc:toolchain_type"]

    config_info = ctx.attr.config[SqlcConfigInfo]
    query_files = config_info.queries
    schema_files = config_info.schema
    config_file = config_info.config

    # Combine all inputs
    all_inputs = query_files + schema_files + [config_file]

    # Declare output files. sqlc generates models.go, db.go, and one .go file
    # per query .sql file.
    output_files = [
        ctx.actions.declare_file("models.go"),
        ctx.actions.declare_file("db.go"),
    ]
    for query_file in query_files:
        output_files.append(ctx.actions.declare_file(query_file.basename + ".go"))

    ctx.actions.run_shell(
        inputs = all_inputs,
        outputs = output_files,
        tools = [toolchain.sqlcinfo.tool_files[0]],
        command = "{} generate --file {}".format(
            toolchain.sqlcinfo.tool_files[0].path,
            ctx.file.config.path,
        ),
        toolchain = "//sqlc:toolchain_type",
        mnemonic = "SqlcGenerate",
    )

    return DefaultInfo(files = depset(output_files))

sqlc_generate = rule(
    implementation = _sqlc_generate_impl,
    attrs = {
        "config": attr.label(providers = [SqlcConfigInfo], allow_single_file = True),
    },
    toolchains = ["//sqlc:toolchain_type"],
)
