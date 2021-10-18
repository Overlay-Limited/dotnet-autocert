# syntax=docker/dockerfile:1
FROM ubuntu:focal

COPY scripts/ scripts/
# Disable interactive CLI during build
ARG DEBIAN_FRONTEND=noninteractive

# Install Core Tools
RUN apt-get update
RUN apt-get install -y wget 

# Install Dev Tools
RUN apt-get install -y libnss3-tools

# Install ASP.NET Core 5.0
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https dotnet-sdk-5.0

# Generate Self-signed cert for HTTPS
WORKDIR scripts/
RUN ./ubuntu-create-dotnet-devcert.sh
