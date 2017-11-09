FROM buildpack-deps:jessie-curl

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs && npm install -g npm@latest && \

# Install Chrome and Firefox
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list  && \
echo 'deb http://security.debian.org/debian-security jessie/updates main' > /etc/apt/sources.list.d/firefox.list  && \
apt-get update && apt-get install -y -q google-chrome-stable firefox-esr xvfb bzip2 zip

# Install wrappers
COPY scripts/xvfb-chrome.sh /usr/local/bin/google-chrome
ENV CHROME_BIN /usr/local/bin/google-chrome
COPY scripts/xvfb-firefox.sh /usr/local/bin/firefox
ENV FIREFOX_BIN /usr/local/bin/firefox
