ARG BASE_IMAGE=python:3.7-alpine

FROM ${BASE_IMAGE}
#ENV AWS_PROFILE=""
#ENV AWS_DEFAULT_REGION=""
ENV AWS_CONFIG_FILE="~/.aws/config"
ENV AWS_SHARED_CREDENTIALS_FILE="~/.aws/credentials"
ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""

RUN apk update && apk add \
      bash \
      bash-completion
ENV SHELL=/bin/bash
RUN pip install --upgrade awscli 
RUN bash -c "complete -C aws_completer aws"

CMD ["bash", "-c", "while(:;); do date; sleep 1; done"]
