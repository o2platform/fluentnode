**fluent-array** are methods that extend the Javascript's Array object


**Array::add(value...)** adds a value to the current array

    Array::add = (value...)->
      if (value instanceof Array)
          for item in value
              @.push(item)
      else
          @.push([value])
      @

**Array::contains(value)** returns true if the current array has ```value```

todo: add support for value to be an array (similar to what is happening with assert_Contains

    Array::contains       = (value)-> (value in @)

**Array::empty()**

    Array::empty          =        -> @.length == 0

**Array::first**

    Array::first          =        -> if(@.length    ) then @[0]          else null
    Array::fourth         =        -> if(@.length > 3) then @[3]          else null
    Array::last           =        -> if(@.length    ) then @[@.length-1] else null
    Array::log            =        ->
                                        @.str().log()
                                        @

    Array::not_Contains   = (value)-> value not in @
    Array::second         =        -> if(@.length > 1) then @[1]          else null
    Array::size           =        -> @.length
    Array::starts_With    = (value)-> (item for item in @ when value && item.starts_With(value))
    Array::take           = (value)-> if value is -1 then @ else @.slice(0,value)
    Array::third          =        -> if(@.length > 2) then @[2]          else null
    Array::unique         = ()     ->
                                      output = {}
                                      output[@[key]] = @[key] for key in [0...@length]
                                      output.keys()


---
back to [main](fluent.html)