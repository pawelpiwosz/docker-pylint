FROM python:3-alpine

# For Travis build
ARG BUILD_DATE
ARG VCS_REF
ARG VER

LABEL maintainer="Pawel Piwosz <devops@pawelpiwosz.net>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/pawelpiwosz/docker-pylint"
LABEL org.label-schema.name="docker-pylint"
LABEL org.label-schema.description="Lint your Python code"
LABEL org.label-schema.version=$VER


RUN apk --update add --no-cache --virtual .build-deps gcc musl-dev

RUN pip install --upgrade pip
RUN pip install cython
ADD config/ /tmp/config

RUN pip install -r /tmp/config/requirements-default.txt

RUN apk del .build-deps gcc musl-dev

RUN mkdir /pylint
WORKDIR /pylint
ADD scripts/start.sh /start.sh

ENTRYPOINT ["/bin/sh", "/start.sh"]
