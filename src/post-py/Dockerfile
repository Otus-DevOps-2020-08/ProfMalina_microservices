FROM python:3.6.0-alpine

ADD . /app
WORKDIR /app

RUN apk --no-cache --update add build-base && \
    apk --no-cache --update add gcc && \
    apk --no-cache --update add musl-dev && \
    pip install -r /app/requirements.txt && \
    apk del build-base

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
