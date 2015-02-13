#!/bin/bash

if [ ! -f ./node_modules/coffee-coverage/package.json ]; then
  echo 'Installing coverage dependencies'
  npm install coffee-coverage
  npm install html-file-cov
fi

rm -R .coverage

# echo 'Creating instrumented node files'
./node_modules/.bin/coffeeCoverage --path relative ./src ./.coverage/src
./node_modules/.bin/coffeeCoverage --path relative ./test ./.coverage/test
cp ./src/fluentnode.js ./.coverage/src/fluentnode.js

mocha -R html-file-cov ./.coverage/test  --recursive

#echo 'Removing instrumented node files'
#rm -R .coverage

echo 'Opening browser with coverage.html'
mv coverage.html .coverage/coverage.html
open .coverage/coverage.html

#echo Uninstalling dependencies
#npm uninstall coffee-coverage
#npm uninstall html-file-cov
