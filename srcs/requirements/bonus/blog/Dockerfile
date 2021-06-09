FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y sudo yarn vim curl wget npm

WORKDIR /usr/app
COPY ./conf/. .
COPY ./tools/entrypoint.sh ./

ENTRYPOINT	["bash", "entrypoint.sh"]
