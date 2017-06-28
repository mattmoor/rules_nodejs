workspace(name = "rules_nodejs")

git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/mattmoor/rules_docker.git",
    commit = "a5f57a18575c8f8f60fa9c738f730a16cfdecbd2",
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