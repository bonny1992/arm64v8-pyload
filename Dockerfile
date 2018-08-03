FROM arm64v8/python:3.7-alpine

COPY . ./app

WORKDIR /app

RUN pip install pyload-ng[full]

EXPOSE 8010
EXPOSE 7447

CMD pyload start --profile bonny