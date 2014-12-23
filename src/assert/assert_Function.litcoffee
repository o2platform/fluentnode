back to [main](fluent.html)

dependencies

    assert = require('assert')

**Function::assert_Throws()**

    Function::assert_Throws             = ->
      message = "[assert_Throws]"
      assert.throws(@, null, message)
      return @

**Function::assert_Not_Throws()**

    Function::assert_Not_Throws         = ->
      message = "[assert_Not_Throws]"
      assert.doesNotThrow(@, null, message)
      return @

**Function::assert_Is_Function()**

    Function::assert_Is_Function        = ->
      message = "[assert_Is_Function]"
      test    = typeof(@)
      assert.equal(test, 'function', message)
      @