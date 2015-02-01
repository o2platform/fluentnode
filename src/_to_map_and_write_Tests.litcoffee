These are working methods that need to be added to respective source code file (with a unit test)


Static singleton retriever/loader

    class Singleton
      __instance = null

      @get: ->
        if not @__instance?
          @__instance = new @
          @__instance.init()

        @__instance
