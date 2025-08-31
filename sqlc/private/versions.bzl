"""Mirror of release info

TODO: generate this file from GitHub API"""

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
TOOL_VERSIONS = {
    "1.29.0": {
        "linux_amd64": "sha384-dIPwiFm9yrpywyD3LjZ6ZN78kt6JNNkJKnDeImSnNYkDmWKl5/3XL//rsM52dVjI",
        "linux_arm64": "sha384-vrMCMsvyDXuWdKz65gYZ+yi6LBmQWLP4oYIryTr1ycOg8NRduiQ+Vo7TzM+Q8+pE",
        "darwin_amd64": "sha384-7vdOoT9qZ3RpfGQlaIf5TNYyfvzKbLXafN79ohGRMzowoQNlCuBR2wLBcncinzwb",
        "darwin_arm64": "sha384-3JJS++AQrNcjvudyKVr13/WiUxND0yneqNjZv5XEVao7YGNkE0HS3Lx+W6MKlcIf",
    },
}
