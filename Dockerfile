FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    curl \
    apt-utils \
    vim \
    postgresql-client \
    unixodbc-dev \
    freetds-dev \
    pkg-config

WORKDIR /usr/src/app

RUN python3 -m venv /usr/src/app/.venv

ENV PATH="/usr/src/app/.venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --upgrade pip setuptools wheel
RUN pip install --upgrade Cython
RUN pip install -r requirements.txt

COPY . .

CMD ["/bin/bash"]