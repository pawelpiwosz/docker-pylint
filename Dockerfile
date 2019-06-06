FROM python:3-alpine

RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN pip install cython

RUN pip install --upgrade pip
RUN pip install pylint
RUN apk del .build-deps gcc musl-dev

RUN mkdir /pylint
WORKDIR /pylint

ENTRYPOINT ["pylint"]
