# docker-nodejs-firefox-chrome

Firefox and Chrome running headless under Jessie in a Docker container with NodeJS.

## Examples

### Running tests using Karma.js:

```
git clone https://github.com/JoeNyland/karma-jasmine-require-demo.git
cd karma-jasmine-require-demo
docker run -it --rm -v $(pwd):/app -w /app joenyland/nodejs-firefox-chrome /bin/sh -c "npm install && npm test -- --single-run --no-autowatch"
```
