FROM ubuntu:disco

WORKDIR /git

RUN apt update && apt install -y curl jq git

RUN git clone --depth=1 https://github.com/mustaphazorgati/taskana-release-script.git

COPY entrypoint.sh /git/entrypoint.sh

ENTRYPOINT ["/git/entrypoint.sh"]
