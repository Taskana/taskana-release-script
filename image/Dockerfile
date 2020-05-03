FROM ubuntu:bionic

WORKDIR /git

RUN apt update && apt install -y curl jq git

RUN git clone --depth=1 https://github.com/taskana/taskana-release-script.git

COPY entrypoint.sh /git/entrypoint.sh

ENTRYPOINT ["/git/entrypoint.sh"]
