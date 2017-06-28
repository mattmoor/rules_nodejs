workspace(name = "rules_nodejs")

git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/mattmoor/rules_docker.git",
    commit = "4cd788c673b53b0ba08f00a61c91fbb818e5129e",
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