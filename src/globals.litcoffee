##global methods

These are helper methods that are added to the global object, the main reason is that they can handle null values,
where the normal prototypes are not able to detect that (in a controlled way)


    global.existy = (value)->
      value?

    global.truthly = (value)->
      value? and value != false