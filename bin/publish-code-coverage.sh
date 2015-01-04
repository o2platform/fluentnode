#!/bin/bash

if [ ! -f ./node_modules/mocha-lcov-reporter/package.json ]; then
  echo 'Installing coverage dependencies'
  npm install coffee-coverage
  npm install mocha-lcov-reporter
  npm install coveralls
fi

# echo 'Creating instrumented node files'
./node_modules/.bin/coffeeCoverage --path relative ./src ./.coverage/src
./node_modules/.bin/coffeeCoverage --path relative ./test ./.coverage/test

echo 'Running Tests and Publishing to coveralls'
mocha -R mocha-lcov-reporter .coverage/test --recursive | sed 's,SF:,SF:src/,;/test/s,src,test,' | ./node_modules/coveralls/bin/coveralls.js

echo 'Removing instrumented node files'
rm -R .coverage
