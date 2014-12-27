FluentNode &nbsp;&nbsp;&nbsp;[![Build Status](https://travis-ci.org/o2platform/fluentnode.svg?branch=master)](https://travis-ci.org/o2platform/fluentnode)
==========

[![NPM](https://nodei.co/npm/fluentnode.png)](https://nodei.co/npm/fluentnode/)

[![NPM](https://nodei.co/npm-dl/fluentnode.png)](https://nodei.co/npm/fluentnode/)

**FluentNode** is a set of [Node.js](http://nodejs.org/) Javascript APIs that support [functional](https://en.wikipedia.org/wiki/Functional_programming) programming:

* designed to extent core Javascript/Node objects,
* represents a continuous effort of simplifying complex actions, in order to allow the easy
development and testing of readable code
* written in Literate [Coffee-Script](https://github.com/jashkenas/coffeescript) (using TDD)
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

**folder_Create and folder_Delete** (in [fs.test.coffee](http://o2platform.com/fluentnode/fs.test.html))

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


##Contribute
See the current [Issues list](https://github.com/o2platform/fluentnode/issues) for a good place to start

If you need a function that is currently missing, please fork this repo and send a PR with the implementation and tests :)

##Projects using FluentNode
* TeamMentor 4.0 GraphDB - https://github.com/TeamMentor/TM_4_0_GraphDB
