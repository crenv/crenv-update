#!/usr/bin/env bats

load test_helper

setup() {
  mkdir -p "$CRENV_TEST_DIR"
  cd "$CRENV_TEST_DIR"
}

@test "update shell" {
  export CRENV_SHELL=bash

  run crenv-sh-update

  assert_success
  assert_output "$(which crenv-update) && echo -e \"reloading crenv\" && eval \"\$(crenv init -)\" && echo -e \" | done\""
}

@test "update shell (fish)" {
  export CRENV_SHELL=fish

  run crenv-sh-update

  assert_success
  assert_output "$(which crenv-update); and echo -e \"reloading crenv\"; and . (crenv init - | psub); and echo -e \" | done\""
}
