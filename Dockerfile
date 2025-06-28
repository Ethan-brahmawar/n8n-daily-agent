FROM n8nio/n8n:latest-root

# Switch to root
USER root

# Install system dependencies for Playwright (DEBIAN-compatible now)
RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  ca-certificates \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libgdk-pixbuf2.0-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  libgbm1 \
  libgtk-3-0 \
  && apt-get clean

# Install Playwright with Chromium only (smaller, faster)
RUN npm install playwright && npx playwright install chromium --with-deps

# Switch back to node user
USER node

# n8n environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=changeme
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
