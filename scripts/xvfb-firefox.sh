#!/usr/bin/env bash

# XVFB wrapper for Firefox

_kill_procs() {
  kill -TERM ${FF_PID}
  wait ${FF_PID}
  kill -TERM ${XVFB_PID}
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

XVFB_WHD=${XVFB_WHD:-1024x768x16}

# Start Xvfb
Xvfb :101 -ac -screen 1 ${XVFB_WHD} +extension RANDR -nolisten tcp &
XVFB_PID=$!

export DISPLAY=:101

firefox-esr $@ &
FF_PID=$!

wait ${FF_PID}
wait ${XVFB_PID}
