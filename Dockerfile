# syntax=docker/dockerfile:1
FROM ubuntu:focal
COPY scripts/ scripts/
WORKDIR scripts/
# Disable interactive CLI during build
ARG DEBIAN_FRONTEND=noninteractive

# Install Core Tools
RUN apt-get update && \
    apt-get install -y wget libnss3-tools && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y apt-transport-https dotnet-sdk-5.0 && \
    ./ubuntu-create-dotnet-devcert.sh
