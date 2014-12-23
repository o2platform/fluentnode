back to [main](fluent.html)

dependencies

    assert = require('assert')
    require './assert_Boolean'
    require './assert_Function'
    require './assert_Number'
    require './assert_String'
    require '../Array'
    require '../String'

**Array::assert_Is_Array** [message]

Confirms that a particular object is an array

note: Ideally we could do something like ```assert.equal(typeof(@), 'array', message)``` but that is not working

    Array::assert_Is_Array              = (message)->
      message = message || "[assert_Is_Array]"
      (typeof(@.length)).assert_Is_Equal_To('number')
      assert.equal(typeof(@), 'object', message)
      @

**Array::assert_Contains** value, [message]

    Array::assert_Contains              = (value, message)->
      message = message || "[assert_Contains]"
      if value instanceof Array
        for item in value
          @.contains(item).assert_Is_True("#{item} not found in array: #{@}")
      else
        message = message || "[assert_Contains]"
        @.contains(value).assert_Is_True(message)
      @

**Array::assert_Empty** value,[message]

    Array::assert_Empty                 = (value, message)->
      message = message || "[assert_Empty]"
      @assert_Size_Is(0, message)
      @

**Array::assert_Not_Contains** value, [message]

    Array::assert_Not_Contains          = (value, message)->
      message = message || "[assert_Contains]"
      @.not_Contains(value).assert_Is_True(message)
      @

**Array::assert_Not_Empty** value,[message]

    Array::assert_Not_Empty             = (value, message)->
      message = message || "[assert_Not_Empty]"
      @assert_Size_Is_Not(0, message)
      @

**Array::assert_Size_Is** size,[message]

    Array::assert_Size_Is               = (size, message)->
      message = message || "[assert_Size_Is] expected #{@.length} and it was #{size}"
      assert.equal(@.length, size, message)
      @

**Array::assert_Size_Is_Bigger_Than** size,[message]

    Array::assert_Size_Is_Bigger_Than   = (size, message)->
      message = message || "[assert_Size_Is_Bigger_Than] expected bigger than #{size}, but it was #{@.length} "
      (@.length > size).assert_Is_True(message)
      @

**Array::assert_Size_Is_Not** size,[message]

    Array::assert_Size_Is_Not           = (size, message)->
      message = message || "[assert_Size_Is_Not]"
      assert.notEqual(@.length, size, message)
      @