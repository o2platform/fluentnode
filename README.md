FluentNode
==========

Fluent apis for node (based on the concepts used in C#'s FluentSharp

install using
<pre>npm install fluentnode</pre>

**Methods implemented (NOTE LIST NOT FULLY UPDATED)**

* fluent-array
 * **{array}.empty()**  - true if array is empty
 * **{array}.first()**  - first element of an array same as array[0]
 * **{array}.second()** - second element of an array same as array[1]
 * **{array}.third()**  - third element of an array same as array[2]
 * **{array}.forth()**  - forth element of an array same as array[3]
 * **{array}.size()**   - size  of the array

* fluent-console
 * **{object}.log()**          - log to console
 * **{object}.console_log()**  - log to console

* fluent-fs
 * **{string}.exists()**            - same as {object}.fileExists()
 * **{string}.file_Exists()**       - true if a file called {string} exists (same as fs.existsSync)
 * **{string}.file_Not_Exists()**   - false if a file called {string} exists (same as not fs.existsSync)
 * **{string}.is_Directory()**      - same as {string}.is_Folder()
 * **{string}.is_Folder()**         - same as fs.lstatSync({string}).isDirectory()
 * **{string}.is_File()**           - same as fs.lstatSync({string}).isFile()
 * **{string}.files_and_Folders()** - list of files and folders from folder (returns full path)
 * **{string}.files()**             - list of files from folder (returns full path)
 * **{string}.files(extension)**    - list of files from folder with extension (returns full path)
 * **{string}.folders()**           - list of folders from folder (returns full path)


* fluent-path
 * **{pathA}.path.join({pathA}**   - same as path.join(pathA, pathB)
 * **{pathA}.path_Combine({pathA}** - same as path.join(pathA, pathB)


* fluent-object
 * **{object}.str()**          - same as {object}.toString()
 * **{string}.json()**         - same as JSON.stringify({object})
 * **{string}.json_inspect()** - same as util.inspect({object})   (handles circlar references)
 
 * fluent-string
 * **{string}.append({stringToAppend})**              - same as {string} + {stringToAppend}
 * **{string}.add_Random_Chars({stringToAppend})**    - adds a number of chars {stringToAppend}
 * **{string}.add_Random_String({stringToAppend})**   - adds a number of letters and/or numbers to {stringToAppend}
 * **{string}.size({string})**                        - same as {string}.length

all methods and tests are written in CoffeScript

### Development

Build Status: [![Build Status](https://travis-ci.org/o2platform/FluentNode.svg?branch=master)](https://travis-ci.org/o2platform/FluentNode)
