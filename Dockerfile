FROM python:3-alpine

RUN apk --update add --no-cache --virtual .build-deps gcc musl-dev

RUN pip install --upgrade pip
RUN pip install cython
ADD requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt

RUN apk del .build-deps gcc musl-dev

RUN mkdir /pylint
WORKDIR /pylint
ADD scripts/start.sh /start.sh

ENTRYPOINT ["/bin/sh", "/start.sh"]
