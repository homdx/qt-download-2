#!/bin/bash

while sleep 60s; do echo "=====[ $SECONDS seconds still running ]====="; done & docker build -t test . && echo done build docker && kill %1
