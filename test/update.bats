#!/usr/bin/env bats

load test_helper

setup() {
  mkdir -p "$CRENV_TEST_DIR"
  cd "$CRENV_TEST_DIR"
}

create_shims() {
  local shims="${CRENV_ROOT}/shims/"

  mkdir -p "${shims}"
  touch "${shims}/$1"
  chmod +x "${shims}/$1"
}

create_repository() {
  mkdir -p "$1"
  echo "$2" > "$1/.repository-name"
}

@test "update crenv" {
  create_shims "crenv"
  create_repository "$CRENV_ROOT/shims/" "crenv"
  mkdir -p "$CRENV_ROOT/plugins/"

  run crenv-update

  assert_success
  assert_line 0 "updating crenv"
  assert_line 1 " | crenv"
  assert_line 2 " | pull --no-rebase --ff"
}

@test "update crystal-build" {
  create_shims "crenv"
  create_repository "$CRENV_ROOT/shims/" "crenv"
  create_repository "$CRENV_ROOT/plugins/crystal-build/" "crystal-build"

  run crenv-update

  assert_success
  assert_line 3 "updating crystal-build"
  assert_line 4 " | crystal-build"
  assert_line 5 " | pull --no-rebase --ff"
}

@test "update not crenv git repository" {
  create_shims "crenv"
  mkdir -p "$CRENV_ROOT/shims/"

  run crenv-update

  assert_success
  assert_line 0 "updating crenv"
  assert_line 1 " | Not an crenv git repo; skipping..."
}

@test "update not crystal-build git repository" {
  create_shims "crenv"
  create_repository "$CRENV_ROOT/shims/" "crenv"
  mkdir -p "$CRENV_ROOT/plugins/crystal-build/"

  run crenv-update

  assert_success
  assert_line 3 "updating crystal-build"
  assert_line 4 " | Not an crenv git repo; skipping..."
}
