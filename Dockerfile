FROM n8nio/n8n:1.22.1

# Switch to root to install packages
USER root

# Install Chromium dependencies using Alpine's apk
RUN apk add --no-cache \
  wget \
  ca-certificates \
  libstdc++ \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ttf-freefont \
  bash

# Optional: set Chromium path for scraping tools (e.g., Puppeteer)
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Switch back to n8n's default user
USER node

# n8n env vars
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=changeme
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
