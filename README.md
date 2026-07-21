# Yocto Dev Environment (kas-container)

Reproducible Yocto build/dev-shell using [kas](https://github.com/siemens/kas) in Docker. No local Yocto/BitBake install needed.

## Prerequisites

- Docker installed, and your user in the `docker` group.

## Setup

```bash
git clone https://github.com/lilianfelenc/yocto-build-template.git
cd yocto-build-template
chmod +x kas-container
```

## Usage

| Command         | What it does                                      |
|-----------------|----------------------------------------------------|
| `make shell`    | Interactive dev shell inside the container, BitBake env sourced |
| `make build`    | Non-interactive full build (CI-friendly)           |
| `make menuconfig` | Kernel menuconfig inside the container            |
| `make clean`    | Remove local `build/` output (caches untouched)    |
| `make cleanall`    | Wipe cache in `~/yocto-cache/`                 |

Example:

```bash
make shell
bitbake core-image-minimal
exit
```

## Config

- `project-config.yml` — machine, distro, layers, local.conf overrides
- `.env` — pinned image version + shared cache locations (edit paths if needed)

Download and sstate caches live outside the repo (`~/yocto-cache/`) so they're shared across projects/clones instead of duplicated.

## Notes

- The project directory must be a git repo (or `kas-container` prints harmless git/hg warnings). `git init` if you haven't already.
- To change target machine/branch, edit `kas-project.yml`.

## Third-party components

`kas-container` is vendored from [siemens/kas](https://github.com/siemens/kas) (MIT License, Copyright (c) Siemens AG).
