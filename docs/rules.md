<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Public API re-exports

<a id="sqlc_config"></a>

## sqlc_config

<pre>
load("@regb_rules_sqlc//sqlc:defs.bzl", "sqlc_config")

sqlc_config(<a href="#sqlc_config-name">name</a>, <a href="#sqlc_config-engine">engine</a>, <a href="#sqlc_config-package">package</a>, <a href="#sqlc_config-queries">queries</a>, <a href="#sqlc_config-schema">schema</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="sqlc_config-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="sqlc_config-engine"></a>engine |  SQL engine   | String | required |  |
| <a id="sqlc_config-package"></a>package |  The Go package for the generated code   | String | required |  |
| <a id="sqlc_config-queries"></a>queries |  Source SQL query files   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="sqlc_config-schema"></a>schema |  Source SQL migration files   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


<a id="sqlc_generate"></a>

## sqlc_generate

<pre>
load("@regb_rules_sqlc//sqlc:defs.bzl", "sqlc_generate")

sqlc_generate(<a href="#sqlc_generate-name">name</a>, <a href="#sqlc_generate-config">config</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="sqlc_generate-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="sqlc_generate-config"></a>config |  -   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |


