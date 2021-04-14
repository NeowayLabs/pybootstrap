FROM python:3.7-slim

# install git
RUN apt-get update && apt-get install -y git

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt


COPY ./project /app/project
COPY ./tests/ /app/tests/
COPY ./hack/ /app/hack/


ENV PYTHONPATH /app
ENV PYTHONDONTWRITEBYTECODE 1

RUN python --version

WORKDIR /app
