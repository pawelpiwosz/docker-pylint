## Python3 pylint container
#### Tests status

### Synopsis

Validate your Python code.

### Pull image

In order to pull the imange, run:

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

