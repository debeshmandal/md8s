# md8s

![build](https://github.com/debeshmandal/md8s/actions/workflows/build.yml/badge.svg)

A framework for experimenting with molecular dynamics and scientific computing through containers.

## Docker Images

The `/docker` folder contains folders each containing a `Dockerfile` or set thereof to build
Docker images. In the root of the `/docker` folder is a `Makefile` that can be called with
`make` which will automatically build and tag each of the images with the current `git`
version string, with the git hash truncated to 6 characters where appropriate.

## External Packages

The `/extern` folder containers a set of git submodules. It currently contains the following packages:
- [LAMMPS](https://github.com/lammps/lammps)
