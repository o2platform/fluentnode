dependencies

    child_process = require('child_process')

**String::start_Process** args...

    String::start_Process = (args...)->
      args ?= []
      if args.first() instanceof Array
        args = args.first()
      return child_process.spawn(@.str(),args)

**String::start_Process_Redirect_Console** args...

    String::start_Process_Redirect_Console = (args...)->
      args ?= []
      childProcess = @.start_Process(args)
      childProcess.stdout.on 'data', (data)->console.log(data.str().trim())
      childProcess.stderr.on 'data', (data)->console.log(data.str().trim())
      return childProcess

**String::start_Process_Capture_Console_Out** args..., callback

    String::start_Process_Capture_Console_Out =  (args..., callback)->
        closed = false                  # these values are used by call_Callback
        exited = false                  # to ensure that both exit and close been called

        call_Callback = ()->
          if closed and exited
            process.nextTick ()->
              callback(consoleData)

        consoleData = ""
        childProcess = @.start_Process(args)
        childProcess.stdout.on 'data', (data)->consoleData+=data
        childProcess.stderr.on 'data', (data)->consoleData+=data

        childProcess.on 'close', ()->          # there where a couple issues when exit was called without all data being available on consoleData
          closed = true
          call_Callback()

        childProcess.on 'exit', ()->
          exited = true
          call_Callback()

        return childProcess

---
back to [index](index.html)