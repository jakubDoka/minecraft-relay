FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 user

RUN echo ' \n\
echo user:$PASSWORD | chpasswd \n\
service ssh start -p$PORT \n\
/usr/sbin/sshd -D \n\
' > boot.sh

CMD ["sh", "boot.sh"]
