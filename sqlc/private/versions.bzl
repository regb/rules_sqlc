"""Mirror of release info

TODO: generate this file from GitHub API"""

# Releases are available at https://github.com/sqlc-dev/sqlc/releases
#  e.g. "https://github.com/sqlc-dev/sqlc/releases/download/v1.29.0/sqlc_1.29.0_linux_amd64.tar.gz"
#
# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64

TOOL_VERSIONS = {
    "1.29.0": {
        "linux_amd64": "sha384-dIPwiFm9yrpywyD3LjZ6ZN78kt6JNNkJKnDeImSnNYkDmWKl5/3XL//rsM52dVjI",
        "linux_arm64": "sha384-vrMCMsvyDXuWdKz65gYZ+yi6LBmQWLP4oYIryTr1ycOg8NRduiQ+Vo7TzM+Q8+pE",
        "darwin_amd64": "sha384-7vdOoT9qZ3RpfGQlaIf5TNYyfvzKbLXafN79ohGRMzowoQNlCuBR2wLBcncinzwb",
        "darwin_arm64": "sha384-3JJS++AQrNcjvudyKVr13/WiUxND0yneqNjZv5XEVao7YGNkE0HS3Lx+W6MKlcIf",
    },
    "1.30.0": {
        "linux_amd64": "sha384-1F3zb75zzVCsN8zNR67GvQAZDs7NZhTkHlII9D3XTSa9Tdf9NrAJWdQOzkvi2Wjo",
        "linux_arm64": "sha384-SvM6HekEwE6esyh/pRP4e4jzXGAgN2rYSlS3hXsMth8Iv2AYM8FgLPIN2SP74VR1",
        "darwin_amd64": "sha384-FyKzcez4Qcfk2922XTi4Hww+Xdc5l9up2ksiHAtsL+u17lc01WTwOnetJ/tPtoAP",
        "darwin_arm64": "sha384-PJhEBt+NmbziSSKZ+7fwfdyHdR6UDh3nry4cmvlKmYvQqQ/a/gGdebl1ScOnuF+q",
    },
}
