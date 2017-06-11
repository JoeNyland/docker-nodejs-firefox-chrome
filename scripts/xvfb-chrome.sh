#!/usr/bin/env bash

# XVFB wrapper for Chrome

_kill_procs() {
  kill -TERM ${CHROME_PID}
  wait ${CHROME_PID}
  kill -TERM ${XVFB_PID}
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

XVFB_WHD=${XVFB_WHD:-1024x768x16}

# Start Xvfb
Xvfb :100 -ac -screen 1 ${XVFB_WHD} +extension RANDR -nolisten tcp &
XVFB_PID=$!

export DISPLAY=:100

google-chrome-stable --no-sandbox $@ &
CHROME_PID=$!

wait ${CHROME_PID}
wait ${XVFB_PID}
