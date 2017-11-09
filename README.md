# docker-nodejs-firefox-chrome [![Docker Build Status](https://img.shields.io/docker/build/joenyland/nodejs-firefox-chrome.svg)][docker-hub-image]


Firefox and Chrome running headless under Jessie in a Docker container with NodeJS.

## Examples

### Running tests using Karma.js:

```
git clone https://github.com/JoeNyland/karma-jasmine-require-demo.git
cd karma-jasmine-require-demo
docker run -it --rm -v $(pwd):/app -w /app joenyland/nodejs-firefox-chrome /bin/sh -c "npm install && npm test -- --single-run --no-autowatch"
```

[docker-hub-image]: https://hub.docker.com/r/joenyland/nodejs-firefox-chrome/
