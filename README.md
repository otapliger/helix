# Helix


[![Build status](https://github.com/helix-editor/helix/workflows/ci/badge.svg)](https://github.com/helix-editor/helix/actions)

![Screenshot](./screenshot.png)

A kakoune / neovim inspired editor, written in Rust.

The editing model is very heavily based on kakoune; during development I found
myself agreeing with most of kakoune's design decisions.

For more information, see the [website](https://helix-editor.com).

# Features

- Vim-like modal editing
- Multiple selections
- Built-in language server support
- Smart, incremental syntax highlighting and code editing via tree-sitter

It's a terminal-based editor first, but I'd like to explore a custom renderer
(similar to emacs) in wgpu or skulpin.

# Installation

Note: Only the Rust syntax has indentation definitions at the moment.

We provide packaging for various distributions, but here's a quick method to
build from source.

```
git clone --recurse-submodules --shallow-submodules -j8 https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term
```

This will install the `hx` binary to `$HOME/.cargo/bin`.

Now copy the `runtime/` directory somewhere. Helix will by default look for the
runtime inside the same folder as the executable, but that can be overriden via
the `HELIX_RUNTIME` environment variable.

# Contributing

Contributors are very welcome! **No contribution is too small and all contributions are valued.**

Some suggestions to get started:

- You can look at the [good first issue](https://github.com/helix-editor/helix/labels/good%20first%20issue) label on the issue tracker.
- Help with packaging on various distributions needed!
- If your preferred language is missing, integrating a tree-sitter grammar for
    it and defining syntax highlight queries for it is straight forward and
    doesn't require much knowledge of the internals.

We provide an [architecture.md](./docs/architecture.md) that should give you
a good overview of the internals.

# Getting help

Discuss the project on the community [Matrix channel](https://matrix.to/#/#helix-editor:matrix.org).

