dependencies

    assert = require 'assert'

**String::assert_Contains(target)**

    String::assert_Contains             = (target)->
      source    = @.toString()
      message   = "expected string '#{source}' to contain the string '#{target}'"
      assert(source.indexOf(target)> -1, message)
      @

**String::assert_Not_Contains(target)**

    String::assert_Not_Contains         = (target)->
      source    = @.toString()
      message   = "expected string '#{source}' to not contain the string '#{target}'"
      assert(source.indexOf(target) == -1, message)
      @

    String::assert_Is_Equal_To          = (target)->
      source    = @.toString()
      assert.equal(source, target)
      @

    String::assert_Is_Not_Equal_To       = (target)->
      assert.notDeepEqual(@.toString(), target.toString())
      @

    String::assert_Is_Json              = ->
      contents = @.toString()
      try
        json     = JSON.parse(contents)
        return json
      catch
        throw '[assert_Is_JSON] failed to convert string to json'

    String::assert_Is_String              = =>
      assert.equal(typeof(@), 'object')              # not the best test, but if @ is not a string there will be an run-time-error
      #assert.equal(typeof(@), 'array', message)     # this doesn't work
      @                                              # also not working as expected

    String::assert_Length_Is               = (size)->
      message = "[assert_Length_Is]"
      assert.equal(@.length, size, message)
      @

    String::assert_Length_Is_Not           = (size)->
      message = "[assert_Length_Is_Not]"
      assert.notEqual(@.length, size, message)
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
      test    = folder.folder_Exists().is_False()
      message = "[assert_That_Not_Folder_Exists]: #{folder}"
      assert(test, message)
      folder

    String::assert_Is              = String::assert_Is_Equal_To
    String::assert_Is_Not          = String::assert_Is_Not_Equal_To
    String::assert_Equals          = String::assert_Is_Equal_To
    String::assert_File_Exists     = String::assert_That_File_Exists
    String::assert_File_Not_Exists = String::assert_That_File_Not_Exists
    String::assert_Size_Is         = String::assert_Length_Is
    String::assert_Size_Is_Not     = String::assert_Length_Is_Not