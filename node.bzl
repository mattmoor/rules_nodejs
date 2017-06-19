"""Build Node.js base image from package.json"""

def _impl(repository_ctx):
  """Core implementation of docker_pull."""

  # TODO(mattmoor): Is there a way of doing this so that
  # consumers can just depend on @base//image ?
  repository_ctx.file("BUILD", """
package(default_visibility = ["//visibility:public"])

load(
  "@io_bazel_rules_docker//docker:docker.bzl", "docker_build"
)

docker_build(
   name = "image",
   base = "@node_base//image:image.tar",

   # entrypoint = ["node"],

   directory = "/app",
   # TODO(mattmoor): https://github.com/bazelbuild/bazel/issues/2176
   data_path = ".",
   files = glob(["node_modules/**/*"]),
   workdir = "/app",
)
""")

  target = repository_ctx.path("package.json")
  repository_ctx.symlink(repository_ctx.attr.package_json, target)

  result = repository_ctx.execute(["npm", "install"])
  if result.return_code:
    fail("npm install failed: %s" % result.stderr)

_node_image = repository_rule(
    attrs = {
        "package_json": attr.label(allow_files=[".json"]),
        # TODO(mattmoor): Alternately allow a dict?
        # TODO(mattmoor): Allow customizing base?
    },
    implementation = _impl,
)

def node_image(**kwargs):
  """Build a Node.js base image."""
  _node_image(**kwargs)