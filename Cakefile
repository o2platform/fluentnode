{spawn, exec} = require 'child_process'
fs            = require 'fs'
path          = require 'path'
srcFolder     = './src'

option '-w', '--watch'          , 'continually build the docco files (in /docs'
option '-l', '--layout [LAYOUT]', 'specify the layout for Docco\'s docs'
option '-v', '--verbose'        , 'show docco console out'

task 'doc', 'rebuild the Docco documentation', (options) ->
  layout = options.layout or 'linear'
  run_Task = ()->
    console.time('docco build in')
    commands =  [ "node_modules/.bin/docco --layout #{layout} #{srcFolder}/**/**.**"
                  "node_modules/.bin/docco --layout #{layout} #{srcFolder}/**.**"]
                  #"sed \"s/docco.css/resources\\/#{layout}\\/docco.css/\" < docs/docco.html > index.html"
                  #'rm -r docs']

    execResult = (err,stdout, stderr) ->
      throw err if err
      console.log stdout if options.verbose

    (exec commands.join(' && '), execResult).on 'exit', -> console.timeEnd('docco build in')

  if (options.watch)
    console.log "Watching folder: #{srcFolder}"
    fs.watch srcFolder, ()->
        console.log "Folder watch on #{srcFolder} triggered"
        run_Task()

  run_Task()