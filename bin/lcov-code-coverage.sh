#!/bin/bash
if [ ! -f ./node_modules/mocha-lcov-reporter/package.json ]; then
  echo 'Installing coverage dependencies'
  npm install jscover
  npm install coffee-coverage
  npm install mocha-lcov-reporter
fi

# set -o errexit # Exit on error
#echo 'Removing cache files'
#rm -f -R .tmCache

mocha --compilers coffee:coffee-script/register --recursive

echo 'Creating instrumented node files'
echo '    for CoffeeScript'
coffeeCoverage --path relative ./src ./.coverage/src
coffeeCoverage --path relative ./test ./.coverage/test

echo 'Running with mocha-lcov-reporter and saving it to coverage'
mocha -R mocha-lcov-reporter .coverage --recursive | sed 's,SF:,SF:src/,;/test/s,src,test,' > ./.coverage/lcov.info
