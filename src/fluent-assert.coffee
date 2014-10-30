require './fluent-boolean'
require './fluent-path'
assert = require('assert')

Boolean::assert_Is_True             = ->
                                          message = "[assert_Is_True]"
                                          assert.equal(@, true, message)
                                          return true

Boolean::assert_Is_False            = ->
                                          message = "[assert_Is_False]"
                                          assert.equal(@, false, message)
                                          return false

Function::assert_Throws             = ->
                                          message = "[assert_Throws]"
                                          assert.throws(@, null, message)
                                          return @
Function::assert_Not_Throws         = ->
                                          message = "[assert_Not_Throws]"
                                          assert.doesNotThrow(@, null, message)
                                          return @
Function::assert_Is_Function        = ->
                                          message = "[assert_Is_Function]"
                                          test    = typeof(@)
                                          assert.equal(test, 'function', message)
                                          #return @
String::assert_Is_Equal_To          = (target)->
                                          #message = "[assert_Is_Equal_To]"
                                          source    = @.toString()
                                          assert.equal(source, target)
                                          @
String::assert_That_File_Exists     = ->
                                          file    = @.toString()
                                          test    = file.file_Exists()
                                          message = "[assert_That_File_Exists]: #{file}"
                                          assert(test, message)
                                          file

String::assert_That_File_Not_Exists = ->
                                          file    = @.toString()
                                          test    = file.file_Not_Exists()
                                          message = "[assert_That_File_Not_Exists]: #{file}"
                                          assert(test, message)
                                          file

String::assert_That_Folder_Exists   = ->
                                          folder    = @.toString()
                                          test    = folder.folder_Exists()
                                          message = "[assert_That_Folder_Exists]: #{folder}"
                                          assert(test, message)
                                          folder

String::assert_That_Folder_Not_Exists = ->
                                          folder    = @.toString()
                                          console.log folder
                                          test    = folder.folder_Exists().is_False()
                                          message = "[assert_That_Not_Folder_Exists]: #{folder}"
                                          assert(test, message)
                                          folder