FROM mcr.microsoft.com/devcontainers/base:${templateOption:imageVariant}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get -y install --no-install-recommends git

RUN git clone https://github.com/public-rant/videos.git /workspaces/videos

RUN mkdir -p /usr/local/etc \
    && echo "${templateOption:greeting}" > /usr/local/etc/greeting.txt
