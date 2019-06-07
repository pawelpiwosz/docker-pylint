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

### Pass custom requirements

This container allows to pass custom requirements.txt file.  
By default, `config` directory is mount in container and
`requirements-default.txt` is installed.  
You can add another file to the `config` directory, and execute it during
running image. Example below.

### Dependencies

In order to have proper environment for check, you can build this container
by yourself, adding needed packages to the `requirements.txt` file before
build.

__`pylint` and `pylint-exit` must stay there.__

Or use the custom-config ability, described below.

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
docker run --rm -v $(pwd)/directory:/pylint pylint \
	path_to_the_file_or_module
```

Where `$(pwd)/directory` is a place with Python files to lint.

If additional requirements file need to be passed, run:

```
docker run --rm -v $(pwd):/pylint \
	-v $(pwd)/custom-config:/tmp/custom-config \
	pylint \
	path_to_the_file_or_module requirements-custom.txt
```

Must have:
* directory `custom-config` with your custom requirements file  
* mount this directory under `/tmp/custom-config` inside container.
