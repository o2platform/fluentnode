dependencies

    assert = require 'assert'

@.**String::assert_Contains** target

    String::assert_Contains = (target, message)->
      source    = @.toString()
      message   = message || "expected string '#{source}' to contain the string/array '#{target}'"
      assert(source.contains(target), message)
      @

@.**assert_Empty**

Throws assert exception if @ is not ''

    String::assert_Empty = ->
      throw new Error("Expected empty string but it was #{@}") if @.valueOf() isnt ''
      @

@.**String::assert_File_Contents_Contains** value

Asserts that file ```@``` contents contains the string ```value```

twin method: assert_File_Contains

    String::assert_File_Contents_Contains = (value)->
      message   = "expected file '#{@}' to contain '#{value}'"
      @.file_Contents().assert_Contains value, message
      @.valueOf()

    String::assert_File_Contains = String::assert_File_Contents_Contains

@.**String::assert_File_Contents_Is** value

Asserts that file ```@``` contents is the string ```value```

    String::assert_File_Contents = (value)->
      message   = "expected file '#{@}' to be '#{value}'"
      @.file_Contents().assert_Is value, message
      @.valueOf()

@.**String::assert_File_Deleted** value

    String::assert_File_Deleted = ()->
      message   = "expected file '#{@}' have been deleted'"
      @.file_Delete().assert_Is_True message
      @.valueOf()

@.**String::assert_Not_Contains** target

    String::assert_Not_Contains         = (target)->
      source    = @.toString()
      message   = "expected string '#{source}' to not contain the string '#{target}'"
      assert(source.indexOf(target) == -1, message)
      @

@.**assert_Not_Empty**

Throws assert exception if @ is not ''

    String::assert_Not_Empty = ->
      throw new Error("Expected non empty string but it was ''") if @.valueOf() is ''
      @

@.**assert_Is_Equal_To** target

    String::assert_Is_Equal_To          = (target, message)->
      source    = @.toString()
      assert.equal(source, target, message)
      @

    String::assert_Is_Not_Equal_To       = (target, message)->
      assert.notDeepEqual(@.valueOf(), target.valueOf(), message)
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

@.**assert_That_Folder_Exists**

Assert that ```@``` is a folder and that is exists

twin methods: assert_Is_Folder

    String::assert_That_Folder_Exists   = ->
      folder  = @.toString()
      test    =
      message = "Expected #{folder} to exist"
      folder.folder_Exists().assert_Is_True message
      folder

    String::assert_Is_Folder = String::assert_That_Folder_Exists


    String::assert_That_Folder_Not_Exists = ->
      folder    = @.toString()
      test    = folder.folder_Exists().is_False()
      message = "[assert_That_Not_Folder_Exists]: #{folder}"
      assert(test, message)
      folder

    String::assert_Is                = String::assert_Is_Equal_To
    String::assert_Is_Not            = String::assert_Is_Not_Equal_To
    String::assert_Equals            = String::assert_Is_Equal_To
    String::assert_File_Exists       = String::assert_That_File_Exists
    String::assert_File_Not_Exists   = String::assert_That_File_Not_Exists
    String::assert_Folder_Exists     = String::assert_That_Folder_Exists
    String::assert_Folder_Not_Exists = String::assert_That_Folder_Not_Exists
    String::assert_Size_Is           = String::assert_Length_Is
    String::assert_Size_Is_Not       = String::assert_Length_Is_Not

---
back to [index](index.html)
