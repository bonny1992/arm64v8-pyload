FROM arm64v8/python:2.7-alpine

RUN apk add --update ca-certificates wget unzip && \
    update-ca-certificates && \
    wget https://github.com/pyload/pyload/archive/stable.zip && \
    unzip stable.zip && mv pyload-stable/ /usr/share/pyload && \
    apk del unzip && \
    apk add --update py-jinja2 py-curl 

COPY . ./app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8010
EXPOSE 7447

CMD python /usr/share/pyload/pyLoadCore.py