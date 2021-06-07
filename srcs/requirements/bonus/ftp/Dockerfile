FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y vsftpd wget curl vim
COPY ./tools/entrypoint.sh ./
COPY ./conf/vsftpd.conf /etc
COPY ./conf/vsftpd.chroot_list /etc
COPY ./conf/vsftpd.user_list /etc
EXPOSE 21
ENTRYPOINT ["bash", "entrypoint.sh"]
