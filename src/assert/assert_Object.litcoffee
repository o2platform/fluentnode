dependencies

    assert = require 'assert'

**assert_Is_Equal_To(target)**

    Object.defineProperty Object.prototype, 'assert_Is_Equal_To',
      enumerable  : false,
      writable    : true,
      value: (target)->
        assert.deepEqual(@, target)
        @

    Object.defineProperty Object.prototype, 'assert_Is_Instance_Of',
      enumerable  : false,
      writable    : true,
      value: (target)->
        (@ instanceof target).assert_Is_True("object was not of expected type/instance") #"expected type of be '#{typeof(@)}' and it was #{typeof(target)}")
        @

    Object.defineProperty Object.prototype, 'assert_Is_Not_Equal_To',
      enumerable  : false,
      writable    : true,
      value: (target)->
        assert.notDeepEqual(@, target)
        @
    Object.defineProperty Object.prototype, 'assert_Is_Object',
      enumerable  : false,
      writable    : true,
      value: (target)->
        assert.equal(typeof(@), 'object')
        @

    Object.defineProperty Object.prototype, 'assert_Is_Null',
      enumerable  : false,
      writable    : true,
      value: (target)->
        (target == null).assert_Is_True("expected value to be null:" + target)
        null

    Object.defineProperty Object.prototype, 'assert_Is_Not_Null',
      enumerable  : false,
      writable    : true,
      value: (target)->
        (target == null).assert_Is_False("expected value to not be null")
        target

    Object.defineProperty Object.prototype, 'assert_Is_Undefined',
      enumerable  : false,
      writable    : true,
      value: (target)->
        (typeof(target) == 'undefined').assert_Is_True("expected value to be undefined:" + target)
        null

    Object.defineProperty Object.prototype, 'assert_Is_Not_Undefined',
      enumerable  : false,
      writable    : true,
      value: (target)->
        (typeof(target) == 'undefined').assert_Is_False("expected value to not be undefined")
        target

    Object.defineProperty Object.prototype, 'assert_Instance_Of',enumerable  : false, writable    : true, value: Object::assert_Is_Instance_Of
    Object.defineProperty Object.prototype, 'assert_Is'         ,enumerable  : false, writable    : true, value: Object::assert_Is_Equal_To
    Object.defineProperty Object.prototype, 'assert_Is_Not'     ,enumerable  : false, writable    : true, value: Object::assert_Is_Not_Equal_To
    
---
back to [index](index.html)
