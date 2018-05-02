# Real Petite Kernel
Minimal, hermetic OSDev setup via NASM, TCC, and GRUB.
The goal is to build a tiny build system for tiny OS'es.

GCC cross compilers are nice, but they are large and take forever
to build.

This build system currently only targets x86, but eventually it can
be ported.

The best part is that the build system is maintained locally
(in `third_party/cross`), so it doesn't conflict with existing compilers.

After running `make clean`, the project should only take up about
30MB (at least, currently).

Obviously, if you add a `libc`, that will grow significantly.

## Prerequisites
* Git
* Any C compiler (ideally GCC or Clang)
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
`build/$(NAME).iso`.

## Running on QEMU
`make run`