FROM debian:latest

# Install required packages
RUN apt update && apt install -y wget bzip2 nano tar

# Set the working directory
WORKDIR /opt/teamspeak

# Download and extract TeamSpeak 6 Client
RUN wget -O teamspeak-client.tar.gz https://files.teamspeak-services.com/pre_releases/client/6.0.0-beta2/teamspeak-client.tar.gz2 \
    && tar -xvzf teamspeak-client.tar.gz \
    && rm -rf teamspeak-client.tar.gz

# Expose necessary ports (if applicable)
EXPOSE 9987/udp 10011 30033

# Run the client (if applicable)
CMD ["bash"]
