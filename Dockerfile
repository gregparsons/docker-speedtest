FROM ubuntu

# say hello from docker build
RUN echo "hello"

RUN apt-get update -y
RUN apt-get install -y gnupg1 apt-transport-https dirmngr
ENV INSTALL_KEY=379CE192D401AB61
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
RUN echo "deb https://ookla.bintray.com/debian generic main" | tee  /etc/apt/sources.list.d/speedtest.list
RUN apt-get update
RUN apt-get install speedtest
ENTRYPOINT ["speedtest", "--accept-license"]
