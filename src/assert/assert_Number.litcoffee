dependencies

    assert = require 'assert'

Note: the @ represents this

@.**assert_Bigger_Than** value

twin methods: assert_Above, assert_Is_Bigger

    Number::assert_Bigger_Than = (value)->
      value.assert_Is_Number()
      (@ > value).assert_Is_True("#{@} was not bigger than #{value}")

    Number::assert_Above          = Number::assert_Bigger_Than
    Number::assert_Is_Bigger_Than = Number::assert_Bigger_Than

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

    Number::assert_Is_Not_Equal_To = (target, message)->
      source    = @
      assert.notEqual(source, target, message)
      @

@.**assert_Is_Number**

When checking if is @ is a number, it seems that the only thing we can do
it to check if @ is NaN (which should not be accepetd)

See see issue https://github.com/o2platform/fluentnode/issues/57

note that ```Number('').assert_Is_Number().assert_Is 0```

    Number::assert_Is_Number = ()->
      @.str().assert_Is_Not 'NaN' , 'The provided number was a NaN (Not an Number)'
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
