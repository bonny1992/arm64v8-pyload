FROM arm64v8/python:3.7-alpine

COPY . ./app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8010
EXPOSE 7447

CMD pyload start --profile bonny