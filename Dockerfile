FROM python:3-slim AS dev

ENV WORKDIR /app

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get update && apt-get install -y --no-install-recommends bash zsh neovim git lazygit curl jq ripgrep \
  & pip install --upgrade pip setuptools pytest flake8 mypy black isort bandit python-lsp-server[all]

WORKDIR ${WORKDIR}
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY ./ ./
