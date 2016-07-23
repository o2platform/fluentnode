dependencies

    assert = require('assert')

**Function::assert_Throws()** onError

Asserts that a function throws an exception.

If provided the **callback** method will be called with the Error object

    Function::assert_Throws=  (callback) ->
      message = "[assert_Throws]"
      
      if typeof callback is 'string'                          # support passing a string value as the expected error message
        expected_Message = callback
        callback = (error)->
          error_Message = error.message || error
          error_Message.assert_Is expected_Message, "Expected exception error to be '#{expected_Message}' but it was '#{error_Message}'"
          
      onError = (error)=>
        callback error if callback
        true
      assert.throws(@, onError, message)
      return @

**Function::assert_Not_Throws()**

    Function::assert_Not_Throws         = ->
      message = "[assert_Not_Throws]"
      assert.doesNotThrow(@, message)
      return @

**Function::assert_Is_Function()**

    Function::assert_Is_Function        = ->
      message = "[assert_Is_Function]"
      test    = typeof(@)
      assert.equal(test, 'function', message)
      @

---
back to [index](index.html)
