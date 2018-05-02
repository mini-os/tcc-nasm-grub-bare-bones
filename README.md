# Real Petite Kernel

Minimal, hermetic OSDev setup via NASM, TCC, and GRUB.

The goal is to build a tiny build system for tiny OS'es.

Eventually, I will restructure the third-party dependency
process so that the project does not consume gigabytes of unneeded space.

GRUB is large. It can be deleted after installation; Git submodules
are a naive solution to dependency management.

## Prerequisites
* Git
* Any C compiler
* Mac users **must** install [`objconv`](http://www.agner.org/optimize/#objconv).
The build is simple and takes under a minute.
* Mac (Windows too?) users also **must** install [GNU `xorriso`](https://www.gnu.org/software/xorriso/).
* Mac users must also install GNU mtools: `brew install mtools`

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
`build/rpk.iso`.

## Running on QEMU
`make run`