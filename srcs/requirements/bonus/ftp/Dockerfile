FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y vsftpd wget curl vim
COPY ./tools/entrypoint.sh ./
EXPOSE 21
#ENTRYPOINT ["bash", "entrypoint.sh"]
