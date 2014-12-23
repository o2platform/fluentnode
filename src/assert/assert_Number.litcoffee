dependencies

    assert = require 'assert'

**Number::assert_Is_Equal_To(target)**

    Number::assert_Is_Equal_To          = (target)->
      source    = @
      assert.equal(source, target)
      @

**Number::assert_Is_Not_Equal_To(target)**

    Number::assert_Is_Not_Equal_To      = (target)->
      source    = @
      assert.notEqual(source, target)
      @

**Number::assert_Is_Number()**

    Number::assert_Is_Number            = ()->
      @

**Number::assert_Is(target)**

    Number::assert_Is                   = Number::assert_Is_Equal_To

**Number::assert_Is_Not(target)**

    Number::assert_Is_Not               = Number::assert_Is_Not_Equal_To