FROM arm64v8/python:3.7-alpine

RUN apk add --update git mercurial && \
    git clone https://github.com/pyload/pyload && \
    cd pyload && \
    python setup.py build && \
    python setup.py install && \
    cd .. && \
    rm -rf pyload && \
    apk del git mercurial

EXPOSE 8010
EXPOSE 7447

CMD pyload start --profile bonny