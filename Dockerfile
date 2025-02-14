FROM debian:latest

# Install required packages
RUN apt update && apt install -y wget bzip2 nano tar

# Set the working directory
WORKDIR /opt/teamspeak

# Download and extract TeamSpeak 6 Client
RUN wget -O teamspeak-client.tar.gz https://files.teamspeak-services.com/pre_releases/client/6.0.0-beta2/teamspeak-client.tar.gz \
    && tar -xvzf teamspeak-client.tar.gz \
    && mv teamspeak3-server_linux_amd64/* . \
    && rm -rf teamspeak-client.tar.gz

# Accept the license agreement
RUN touch .ts3server_license_accepted

# Ensure the `ts3server` file is executable
RUN chmod +x ts3server

# Expose necessary ports
EXPOSE 9987/udp 10011 30033

# Run the server
CMD ["./ts3server", "inifile=ts3server.ini"]