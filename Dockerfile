FROM debian:latest

# update
RUN apt update && apt install -y wget bzip2 nano

# config directory
WORKDIR /opt/teamspeak

# download ts3 server
RUN wget https://files.teamspeak-services.com/pre_releases/client/6.0.0-beta2/teamspeak-client.tar.gz \
    && tar xvf teamspeak3-server_linux_amd64-3.13.7.tar.bz2 \
    && mv teamspeak3-server_linux_amd64/* . \
    && rm -rf teamspeak3-server_linux_amd64 teamspeak3-server_linux_amd64-3.13.7.tar.bz2

# agree License Agreement
RUN touch .ts3server_license_accepted

# open port 
EXPOSE 9987/udp 10011 30033

# execute
CMD ["./ts3server", "inifile=ts3server.ini"]
