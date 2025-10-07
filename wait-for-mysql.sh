#!/bin/bash

echo 'Waiting for MySQL to be ready...'

# Wait for MySQL to be fully ready using the healthcheck
while ! curl -s http://mysql:3306 > /dev/null; do
  echo 'MySQL not ready yet, waiting...'
  sleep 3
done

echo 'MySQL is up! Starting application...'
java -jar app.jar
