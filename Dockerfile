FROM python:3-slim AS dev

ENV POETRY_VIRTUALENVS_CREATE false
ENV WORKDIR /app

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get autoremove -y \
  && apt-get install -y --no-install-recommends bash zsh vim neovim git curl ripgrep \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools poetry pytest flake8 mypy black isort bandit python-lsp-server[all]

WORKDIR ${WORKDIR}
COPY ./ ./
RUN poetry install
