child_process = require('child_process')

String::start_Process = (args...)->
  args ?= []
  if args.first() instanceof Array
    args = args.first()
  return child_process.spawn(@.str(),args)

String::start_Process_Redirect_Console = (args...)->
  args ?= []
  childProcess = @.start_Process(args)
  childProcess.stdout.on 'data', (data)->console.log(data.str().trim())
  childProcess.stderr.on 'data', (data)->console.log(data.str().trim())
  return childProcess  

String::start_Process_Capture_Console_Out =  (args..., callback)->
    consoleData = ""
    childProcess = @.start_Process(args)
    childProcess.stdout.on 'data', (data)->consoleData+=data
    childProcess.stderr.on 'data', (data)->consoleData+=data
    childProcess.on 'exit', ()->
      process.nextTick ()->
        callback(consoleData)
    return childProcess
    