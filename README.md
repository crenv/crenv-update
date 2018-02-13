# crenv-update &nbsp;[![Build Status](https://travis-ci.org/crenv/crenv-update.svg?branch=master)](https://travis-ci.org/crenv/crenv-update)

This [crenv](https://github.com/pine/crenv) plugin adds the `crenv update` command that updated crenv and all installed plugins.

## Installation

Simply clone the repository into the plugins directory:

```sh
$ mkdir -p "$(crenv root)/plugins"
$ git clone https://github.com/crenv/crenv-update.git "$(crenv root)/plugins/crenv-update"
```

## Usage

```sh
$ crenv update
```

## Acknowledgement

- [rkh](https://github.com/rkh) crenv-update is copied code from [rbenv-update](https://github.com/rkh/rbenv-update). Thank you.
