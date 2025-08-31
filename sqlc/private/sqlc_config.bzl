"""Rule to generate the sqlc config"""

def _relpath(from_path, to_path):
    from_parts = from_path.split("/")[:-1]  # config file's parent dir
    to_parts = to_path.split("/")

    # Strip common prefix
    i = 0
    max_len = min(len(from_parts), len(to_parts))
    for j in range(max_len):
        if from_parts[j] != to_parts[j]:
            break
        i += 1

    rel_up = [".."] * (len(from_parts) - i)
    rel_down = to_parts[i:]
    return "/".join(rel_up + rel_down)

SqlcConfigInfo = provider(
    doc = "Provide SQLC config info",
    fields = {
        "config": "The generated sqlc config file",
        "engine": "The database engine",
        "queries": "List of query files",
        "schema": "List of schema files",
        "package": "The Go package for the generated code",
    },
)

def _sqlc_config_impl(ctx):
    config_file = ctx.actions.declare_file(ctx.label.name + ".json")
    rel_query_path = [_relpath(config_file.path, f.path) for f in ctx.files.queries]
    rel_schema_path = [_relpath(config_file.path, f.path) for f in ctx.files.schema]

    sql_package = "pgx/v5" if ctx.attr.engine == "postgresql" else "database/sql"

    ctx.actions.write(
        output = config_file,
        content = json.encode({
            "version": "2",
            "sql": [{
                "engine": ctx.attr.engine,
                "queries": rel_query_path,
                "schema": rel_schema_path,
                "gen": {
                    "go": {
                        "package": ctx.attr.package,
                        "out": ".",
                        "sql_package": sql_package,
                        # TODO: might be ok to hardcode, but doesn't seem supported
                        # in mysql so could lead to confusing behavior that varies across
                        # database engines.
                        "emit_pointers_for_null_types": True,
                    },
                },
            }],
        }),
    )
    return [
        DefaultInfo(files = depset([config_file])),
        SqlcConfigInfo(
            config = config_file,
            engine = ctx.attr.engine,
            queries = ctx.files.queries,
            schema = ctx.files.schema,
            package = ctx.attr.package,
        ),
    ]

sqlc_config = rule(
    implementation = _sqlc_config_impl,
    attrs = {
        "engine": attr.string(
            doc = "SQL engine",
            mandatory = True,
            values = ["postgresql", "mysql", "sqlite"],
        ),
        "queries": attr.label_list(
            allow_files = [".sql"],
            mandatory = True,
            doc = "Source SQL query files",
        ),
        "schema": attr.label_list(
            allow_files = [".sql"],
            mandatory = True,
            doc = "Source SQL migration files",
        ),
        "package": attr.string(
            doc = "The Go package for the generated code",
            mandatory = True,
        ),
    },
)
