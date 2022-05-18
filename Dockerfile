# FROM ubuntu:18.04
FROM python:3.9-slim-buster

LABEL name="httpbin"
LABEL version="0.9.2"
LABEL description="A simple HTTP service."
LABEL org.kennethreitz.vendor="Kenneth Reitz"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt update -y && apt install python3-pip git -y && pip3 install --no-cache-dir pipenv

# ADD Pipfile Pipfile.lock /httpbin/
COPY requirements.txt /httpbin/
WORKDIR /httpbin
RUN pip3 install -r requirements.txt
# RUN apt install build-essential
# RUN /bin/bash -c "pip3 install --no-cache-dir setuptools==45"
# RUN /bin/bash -c "pip3 install --no-cache-dir -r <(pipenv lock -r)"

ADD . /httpbin
RUN pip3 install --no-cache-dir /httpbin

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app", "-k", "gevent"]
