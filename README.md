## Python3 pylint container
#### Tests status

[![Build Status](https://travis-ci.org/pawelpiwosz/docker-pylint.svg?branch=master)](https://travis-ci.org/pawelpiwosz/docker-pylint)
[![](https://images.microbadger.com/badges/image/almerhor/pylint:default.svg)](https://microbadger.com/images/almerhor/pylint:default "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/almerhor/pylint:default.svg)](https://microbadger.com/images/almerhor/pylint:default "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/almerhor/pylint:default.svg)](https://microbadger.com/images/almerhor/pylint:default "Get your own commit badge on microbadger.com")

### Synopsis

Validate your Python code.

### Configuration

In order to use this container as a part of my CI/CD pipeline for Python
projects, I needed to have proper exit code - `0` - if there are no errors.
That is why I used `pylint-exit` as an addition to pylint, to capture
exit status of pylint, and handle it before 'real' exit.

### Dependencies

In order to have proper environment for check, you can build this container
by yourself, adding needed packages to the `requirements.txt` file before
build.

__`pylint` and `pylint-exit` must stay there.__

### Pull image

In order to pull the image, run:

```
docker pull almerhor/pylint
```

### Build

In order to build the image by your own, run:

```
docker build -t pylint .
```

### Run container

In order to run the container and check the code, execute:

```
docker run --rm -v $(pwd):/pylint pylint \
	path_to_the_file_or_module
```
