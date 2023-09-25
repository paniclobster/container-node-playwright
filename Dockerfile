# Base image
FROM node:20.7.0-bullseye

# Upgrade base image
RUN apt-get update \
  && apt-get upgrade --assume-yes \
  && rm -rf /var/lib/apt/lists/*

# Install base dependencies
RUN apt-get update \
  && apt-get install --assume-yes \
    gnupg \
    wget \
  && rm -rf /var/lib/apt/lists/*

# Install fonts dependencies
RUN apt-get update \
  && apt-get install --assume-yes \
    fonts-freefont-ttf \
    fonts-ipafont-gothic \
    fonts-kacst \
    fonts-thai-tlwg \
    fonts-wqy-zenhei \
  && rm -rf /var/lib/apt/lists/*

# Install playwright
RUN apt-get update \
  && npm install --global \
    @playwright/test \
    playwright \
  && npx playwright install --with-deps \
  && rm -rf /var/lib/apt/lists/*
