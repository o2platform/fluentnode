dependencies

    assert = require('assert')

@.**assert_False** ([message])

    Boolean::assert_False = ->
      message = "[assert_Is_False]"
      assert.equal(@, false, message)
      return false


@.**assert_Is_False** ([message])

    Boolean::assert_Is_False = Boolean::assert_False


@.**assert_Is_True** ([message])

    Boolean::assert_Is_True = (message)->
      message = message|| "[assert_Is_True]"
      assert.equal(@, true, message)
      return true


@.**assert_True** ([message])

    Boolean::assert_True = Boolean::assert_Is_True

---
back to [index](index.html)