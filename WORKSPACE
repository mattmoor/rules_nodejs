workspace(name = "rules_nodejs")

git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/mattmoor/rules_docker.git",
    commit = "dd8bb1e03a45125f1c64f52276ed9c52a7af2804",
)

load(
  "@io_bazel_rules_docker//docker:docker.bzl",
  "docker_repositories", "docker_pull"
)
docker_repositories()

docker_pull(
  name = "node_base",
  registry = "gcr.io",
  repository = "distroless/nodejs",
)

load(":node.bzl", "node_image")

node_image(
  name = "blah",
  package_json = "//:package.json",
)