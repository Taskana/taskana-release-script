FROM ubuntu:disco

RUN apt update && apt install -y curl jq git

RUN git clone https://github.com/Taskana/taskana.git
RUN git clone https://github.com/mustaphazorgati/taskana-release-script.git
