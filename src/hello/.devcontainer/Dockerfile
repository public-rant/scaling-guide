FROM mcr.microsoft.com/devcontainers/base:${templateOption:imageVariant}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends git curl ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN git clone https://github.com/microsoft/playwright-examples.git /workspaces/videos

RUN mkdir -p /usr/local/etc \
    && echo "${templateOption:greeting}" > /usr/local/etc/greeting.txt
