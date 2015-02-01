##global methods

These are helper methods that are added to the global object, the main reason is that they can handle null values,
where the normal prototypes are not able to detect that (in a controlled way)

**existy** value

confirms that a ```value``` exists (i.e. is not null or undefined)

    global.existy = (value)->
      value?

    global.not_Null = global.existy

**is_Number**

returns true if ```value``` is an number or not NaN

    global.is_Number = (value)->
      (typeof value is 'number') and value.is_Number()


**is_Null**

returns true if ```value``` is null

    global.is_Null = (value)->
      value is null

**file_Exists** file

Returns true if ```file``` exists

    global.file_Exists = (file)->
      if not_Null(file)
        file.file_Exists()
      else
        false

**using** target,callback

simulates a 'using' or 'with' language feaure where the this object (inside callback)
is changed to ```value```

    global.using = (target,callback)->
      callback.apply(target)

**truthly** value

Returns true if ```value``` exists and is not false

    global.truthly = (value)->
      value? and value != false

**log** message

Simple wrapper for console.log

    global.log   = console.log