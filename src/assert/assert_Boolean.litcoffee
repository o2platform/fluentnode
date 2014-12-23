back to [main](fluent.html)

dependencies

    assert = require('assert')

**Boolean::assert_Is_True([message])**

    Boolean::assert_Is_True             = (message)->
      message = message|| "[assert_Is_True]"
      assert.equal(@, true, message)
      return true

**Boolean::assert_Is_False([message])**

    Boolean::assert_Is_False            = ->
      message = "[assert_Is_False]"
      assert.equal(@, false, message)
      return false