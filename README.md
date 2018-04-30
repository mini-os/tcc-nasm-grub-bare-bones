# mini
Minimal, hermetic OSDev setup via NASM, TCC, and GRUB.

## Prerequisites
* Git
* Any C compiler
* Mac users **must** install [`objconv`](http://www.agner.org/optimize/#objconv).
The build is simple and takes under a minute.

## Getting the Dependencies
Get sources via Git:

```bash
git submodule init --recursive
```

Build third-party libraries:

```bash
make third_party
```

## Building
After the dependencies have been built, run `make` to build
`build/kernel.bin`.
