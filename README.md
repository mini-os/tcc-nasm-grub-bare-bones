# mini
Minimal, hermetic OSDev setup via NASM, TCC, and GRUB.

The goal is to build a tiny build system for tiny OS'es.

## Prerequisites
* Git
* Any C compiler
* Mac users **must** install [`objconv`](http://www.agner.org/optimize/#objconv).
The build is simple and takes under a minute.
* Mac (Windows too?) users also **must** install [GNU `xorriso`](https://www.gnu.org/software/xorriso/).

## Getting the Dependencies
Get sources via Git:

```bash
git submodule init
git submodule update --depth 1
```

Build third-party libraries:

```bash
make third_party
```

## Building
After the dependencies have been built, run `make iso` to build
`build/mini.iso`.

## Running on QEMU
`make run`