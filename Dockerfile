FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y net-tools
RUN apt-get install -y cloud-utils
RUN apt-get install -y python
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y qemu
RUN mkdir vm
WORKDIR vm
RUN git clone https://github.com/kanaka/noVNC.git
RUN wget -O ubuntu.img https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img
COPY createseed.sh .
RUN chmod +x createseed.sh
RUN ./createseed.sh
COPY self.pem .
COPY startvm startvm
RUN chmod +x startvm
EXPOSE 22 6080
CMD ["./startvm"]
