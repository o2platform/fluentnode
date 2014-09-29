FluentNode
==========

Fluent apis for node (based on the concepts used in C#'s FluentSharp

Methods implemented

* fluent-array
 * **{array}.empty()**  - true if array is empty
 * **{array}.first()**  - first element of an array same as array[0]
 * **{array}.second()** - second element of an array same as array[1]
 * **{array}.third()** - third element of an array same as array[2]
 * **{array}.forth()** - forth element of an array same as array[3]

* fluent-console
 * **{object}.log()**          - log to console
 * **{object}.console_log()**  - log to console

* fluent-fs
 * **{string}.fileExists()**  - true if a file called {string} exists (same as fs.existsSync)
 * **{string}.files()**       - list of files from folder (same as fs.readdirSync)


* fluent-path
 * **{pathA}.path.join({pathA}**   - same as path.join(pathA, pathB)
 * **{pathA}.pathCombine({pathA}** - same as path.join(pathA, pathB)


* fluent-object
 * **{object}.str()**          - same as {object}.toString()
 * **{string}.json()**         - same as JSON.stringify({object})
 * **{string}.json_inspect()** - same as util.inspect({object})   (handles circlar references)
 

all methods and tests are written in CoffeScript

### Development

Build Status: [![Build Status](https://travis-ci.org/o2platform/FluentNode.svg?branch=master)](https://travis-ci.org/o2platform/FluentNode)
