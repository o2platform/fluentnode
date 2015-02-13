**fluent-array** are methods that extend the Javascript's Array object

@.**add** (value...)

adds a value to the current array

    Array::add = (value...)->
      for item in value
        @.push(item)
      @

@.**contains** (value)

returns true if the current array has ```value```

Suports the case when ```value``` is a an Array, where all provided elements of the ```value``` array are expected to exists in @

    Array::contains = (value)->
      if value instanceof Array
        for item in value
          if not (item in @)
            return false
        return true;
      else
      (value in @)

@.**empty** ()

    Array::empty = ->
      @.length == 0

@.**item** (index)

Returns item[index] if array has that item

Note: Double check behaviour of Array.length and check for possible edge cases

    Array::item = (index)->
      if typeof(index) is 'number'
        if @.length > index > -1
          return @[index]
      null

@.**nth** ()
  
    Array::nth = Array::item

@.**first** () @.**second** () @.**third** () @.**fourth** ()

Helper functions for the nornally requested Array elements

    Array::first  = -> @.item(0)
    Array::second = -> @.item(1)
    Array::third  = -> @.item(2)
    Array::fourth = -> @.item(3)


@.**last** ()

    Array::last  =  ->
      if(@.length)
        @[@.length-1]
      else
        null

@.**log** ()

    Array::log = ->
      @.str().log()
      @

    Array::not_Contains   = (value)-> value not in @

@.**not_Empty** ()

    Array::not_Empty = ->
      @.length != 0

@.**remove_At** index

    Array::remove_At = (index)->
      @.splice(index,1)
      @

@.**remove_First**

    Array::remove_First = ()->
      @.remove_At 0

@.**size**

    Array::size = -> @.length

@.**starts_With** value

    Array::starts_With = (value)->
      (item for item in @ when value && item.starts_With(value))

@.**take** value

    Array::take = (size)->
      if size is -1 then @ else @.slice(0,size)

@.**unique**

    Array::unique  = () ->
      output = {}
      output[@[key]] = @[key] for key in [0...@length]
      output.keys()


---
back to [index](index.html)