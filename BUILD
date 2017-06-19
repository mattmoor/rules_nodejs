package(default_visibility = ["//visibility:public"])

load(
  "@io_bazel_rules_docker//docker:docker.bzl",
  "docker_build",
  "docker_push",
)

docker_build(
   name = "hello",
   base = "@blah//:image.tar",

   # Add our app.
   directory = "/app",
   files = [":hello_express.js"],

   # Configure out app to run
   cmd = ["hello_express.js"],
)

docker_push(
  name = "push",
  image = ":hello",
  registry = "gcr.io",
  repository = "convoy-adapter/nodejs/hello-express"
)