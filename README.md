FluentNode &nbsp;&nbsp;&nbsp;
==========
[![NPM version][npm-version-image]][npm-url] [![NPM downloads][npm-downloads-image]][npm-url] [![MIT License][license-image]][license-url] [![Build Status][travis-image]][travis-url] [![Coverage Status][coveralls-img]][coveralls-url]

[![NPM](https://nodei.co/npm/fluentnode.png)](https://nodei.co/npm/fluentnode/)

[![NPM](https://nodei.co/npm-dl/fluentnode.png)](https://nodei.co/npm/fluentnode/)

**FluentNode** is a set of [Node.js](http://nodejs.org/) Javascript APIs that support [functional](https://en.wikipedia.org/wiki/Functional_programming) programming:

* designed to extent core Javascript/Node objects,
* represents a continuous effort of simplifying complex actions, in order to allow the easy
development and testing of readable code
* written in Literate [Coffee-Script](https://github.com/jashkenas/coffeescript) (using TDD)
* 100% code coverage (on both code and tests)
* based on fluent APIs
* an Javascript implementation of [FluentSharp](https://github.com/o2platform/FluentSharp) (part of OWASP [O2 Platform](http://blog.diniscruz.com/p/owasp-o2-platform.html))

[@Fogus](https://twitter.com/fogus) [Functional Javascript](http://functionaljavascript.com/) book contains a description which completely matches the philosophy behind FluentNode.

In page 25, **Functional programming** is defined as consisting of the following techniques:

* Identifying an abstraction and building a function for it
* Using existing functions to build more complex abstractions
* Passing existing functions to other functions to build even more complex abstractions



## Install on Node.js
```
npm install fluentnode --save
```

## Documentation and FluentNode APIs

The code is written in literate coffee-script where the documentation is part of the sourcecode.

See http://o2platform.com/fluentnode for the list of available functions, annotated source code, and all tests (site created using [docco](https://github.com/jashkenas/docco))

if you are viewing this in GitHub, the individual source code files (linked below) look quite nice (due to GH's support for literate Coffee-Script):

* [Array](src/Array.litcoffee)
* [Boolean](src/Boolean.litcoffee)
* [Function](src/Function.litcoffee)
* [Number](src/Number.litcoffee)
* [Object](src/Object.litcoffee)
* [String](src/String.litcoffee)
* [console](src/console.litcoffee)
* [fs](src/fs.litcoffee)
* [http](src/http.litcoffee)
* [path](src/path.litcoffee)
* [process](src/process.litcoffee)

## Examples

To show FluentNode in action, here are some examples taken from FluentNode's UnitTests

**String::folder_Create and String::folder_Delete** (in [fs.test.coffee](http://o2platform.com/fluentnode/fs.test.html))

```coffee
  it 'folder_Create and folder_Delete' , ->               # tests the String's folder_Create and folder_Delete methods
    "".folder_Create.assert_Is_Function()                 # checks if String::folder_Create exists
    "".folder_Delete.assert_Is_Function()                 # checks if String::folder_Delete exists
    tmpDir = "./".temp_Name_In_Folder()                   # get a temp folder name in the folder provided as string
    tmpDir.folder_Exists().assert_Is_False()              # checks if the folder exists (expects it to be false)
    tmpDir.folder_Create().assert_Is tmpDir.realPath()    # creates folder and confirms that the return value is the full path to the folder
    tmpDir.folder_Exists().assert_Is_True()               # confirms that folders exists
    tmpDir.folder_Delete().assert_Is_True()               # deletes folder (confirming OK result from delete action)
    tmpDir.folder_Exists().assert_Is_False()              # confirms that doesn't exists
```

There are actually two asserts that can be used to simply this code:

```coffee
    tmpDir.assert_Folder_Not_Exists()                     # asserts that folder doesn't exist
          .folder_Create().assert_Is tmpDir.realPath()    # creates folder and confirms that the return value is the full path to the folder
    tmpDir.assert_Folder_Exists()                         # assert that folders exists
          .folder_Delete().assert_Is_True()               # deletes folder (confirming OK result from delete action)
```

**String::file_Contents** (in [fs.test.coffee](http://o2platform.com/fluentnode/fs.test.html))

```coffee
  it 'file_Contents' , ->
    ''.file_Contents.assert_Is_Function()
    file_Name     = '_temp_name_'.add_Random_String(5)
    file_Contents = 'value_'.add_Random_String(5)
    (file_Name.file_Exists().assert_Is_False())
    file_Contents.saveAs(file_Name)
    file_Name.file_Exists().assert_Is_True()
    file_Name.file_Contents().assert_Is(file_Contents)
    file_Name.file_Delete().assert_Is_True()
```

**String::files** (in [fs.test.coffee](http://o2platform.com/fluentnode/fs.test.html))

```coffee
  it 'files' , ->
    ''.files.assert_Is_Function()
    files = './'.files().filter (file) -> file isnt '.DS_Store'.realPath()
    expectedFiles = (file.realPath() for file in '.gitignore,.travis.yml,LICENSE,README.md,package.json'.split(','))
    files.assert_Contains(expectedFiles)
    './'.files('.yml' ).assert_Is(['.travis.yml'.realPath()])
    './'.files('.json').assert_Is(['package.json'.realPath()])
```

**String::http_Status** (in [http.test.coffee](http://o2platform.com/fluentnode/http.test.html))

```coffee
  it 'http_Status', (done)->
    ''.http_Status.assert_Is_Function()
    url.http_Status (status)->
      status.assert_Is(200)
      done()
```

**String::http_Get** (in [http.test.coffee](http://o2platform.com/fluentnode/http.test.html))

```coffee
  it 'http_GET' , (done)->
    ''.http_Status.assert_Is_Function()
    req = url.http_GET (err, data, res)->
      assert_Is_Null(err)
      data.assert_Is_String()
      req.assert_Instance_Of(http.ClientRequest)
      res.assert_Instance_Of(http.IncomingMessage)
      data.assert_Is(test_Data)
      done()
```

**String::start_Process_Redirect_Console** (in [process.test.coffee](http://o2platform.com/fluentnode/process.test.html))

```coffee
  it 'start_Process_Redirect_Console', (done)->
    original_log = console.log
    log_Messages = []
    console.log  = (logMsg)-> log_Messages.push(logMsg)

    childProcess = 'ls'.start_Process_Redirect_Console('.')
    childProcess.on 'exit', ->
      console.log 'process ended'
      log_Messages.first() .assert_Contains('README.md')
      log_Messages.second().assert_Is('process ended')
      console.log = original_log
      done()
```

##Contribute
See the current [Issues list](https://github.com/o2platform/fluentnode/issues) for a good place to start

If you need a function that is currently missing, please fork this repo and send a PR with the implementation and tests :)

##Projects using FluentNode
* TeamMentor 4.0 GraphDB - https://github.com/TeamMentor/TM_4_0_GraphDB


[license-image]: http://img.shields.io/badge/Apache-MIT-blue.svg?style=flat
[license-url]: LICENSE

[npm-url]: https://npmjs.org/package/fluentnode
[npm-version-image]: http://img.shields.io/npm/v/fluentnode.svg?style=flat
[npm-downloads-image]: http://img.shields.io/npm/dm/fluentnode.svg?style=flat

[travis-url]: http://travis-ci.org/o2platform/fluentnode
[travis-image]: https://travis-ci.org/o2platform/fluentnode.svg?branch=master

[coveralls-url]: https://coveralls.io/r/o2platform/fluentnode?branch=master
[coveralls-img]: https://coveralls.io/repos/o2platform/fluentnode/badge.png
