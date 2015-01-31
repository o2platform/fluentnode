dependencies

    assert = require 'assert'

Note: the @ represents this

@.**assert_Bigger_Than** value

    Number::assert_Bigger_Than = (value)->
      value.assert_Is_Number()
      (@ > value).assert_Is_True("#{@} was not bigger than #{value}")

@.**assert_In_Between**

asserts that @ is in between **min** and **max**

    Number::assert_In_Between = (min,max )->
      message = "Expected #{@} to be between #{min} and #{max}"
      @.in_Between(min,max).assert_Is_True(message)
      @

@.**assert_Is_Equal_To** target

    Number::assert_Is_Equal_To   = (target)->
      source    = @
      assert.equal(source, target)
      @

@.**assert_Is_Not_Equal_To** target

    Number::assert_Is_Not_Equal_To = (target)->
      source    = @
      assert.notEqual(source, target)
      @

@.**assert_Is_Number**

    Number::assert_Is_Number = ()->
      @

@.**assert_Is** target

    Number::assert_Is = Number::assert_Is_Equal_To

@.**assert_Is_Not** target

    Number::assert_Is_Not = Number::assert_Is_Not_Equal_To

**assert_Smaller_Than** value

    Number::assert_Smaller_Than = (value)->
      (@ < value).assert_Is_True()
---
back to [index](index.html)
