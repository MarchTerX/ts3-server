FROM debian:latest

# Install required packages
RUN apt update && apt install -y wget bzip2 nano tar

# Set the working directory
WORKDIR /opt/teamspeak

# Download and extract TeamSpeak 3 Server
RUN wget -O ts3server.tar.bz2 https://files.teamspeak-services.com/releases/server/3.13.7/teamspeak3-server_linux_amd64-3.13.7.tar.bz2 \
    && tar xvf ts3server.tar.bz2 \
    && mv teamspeak3-server_linux_amd64/* . \
    && rm -rf teamspeak3-server_linux_amd64 ts3server.tar.bz2

# Accept the license agreement
RUN touch .ts3server_license_accepted

# Ensure the `ts3server` file is executable
RUN chmod +x ts3server

# Expose necessary ports
EXPOSE 9987/udp 10011 30033

# Run the TeamSpeak 3 Server
CMD ["./ts3server", "inifile=ts3server.ini"]
