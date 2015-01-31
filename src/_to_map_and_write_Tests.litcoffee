These are working methods that need to be added to respective source code file (with a unit test)






    String::json_GET_With_Timeout = (callback)->
      @.http_GET_With_Timeout (data)->
        callback data.json_Parse()

    String::http_GET_With_Timeout = (callback)->
      timeout = 500
      delay   = 10;
      try_Http_Get = (next) =>
        @.GET (data)        => if data is null then (delay).invoke_After(next) else callback(data)
      run_Tests = (test_Count)=> if test_Count.empty() then @.GET (callback) else try_Http_Get ()->run_Tests(test_Count.splice(0,1))
      run_Tests([0.. ~~(timeout/delay)])




Static singleton retriever/loader

    class Singleton
      __instance = null

      @get: ->
        if not @__instance?
          @__instance = new @
          @__instance.init()

        @__instance
