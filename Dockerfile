FROM buildpack-deps:jessie-curl

# Install node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs && npm install -g npm@latest

RUN apt-get update && apt-get install xvfb -y

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable

# Install firefox
RUN apt-get update && apt-get install -y pkg-mozilla-archive-keyring
RUN echo 'deb http://mozilla.debian.net/ jessie-backports firefox-esr' > /etc/apt/sources.list.d/firefox.list
RUN apt-get update && apt-get install -y -t jessie-backports firefox-esr

# Required for PhantomJS
RUN apt-get update && apt-get install -y bzip2 zip

# Install wrappers
COPY scripts/xvfb-chrome.sh /usr/local/bin/google-chrome
ENV CHROME_BIN /usr/local/bin/google-chrome
COPY scripts/xvfb-firefox.sh /usr/local/bin/firefox
ENV FIREFOX_BIN /usr/local/bin/firefox
