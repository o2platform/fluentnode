{spawn, exec} = require 'child_process'
fs            = require 'fs'
path          = require 'path'
srcFolder     = './src'

option '-w', '--watch'          , 'continually build the docco files (in /docs'
option '-l', '--layout [LAYOUT]', 'specify the layout for Docco\'s docs'
option '-v', '--verbose'        , 'show docco console out'
option '-p', '--publish'        , 'auto commit and publish to github'

task 'doc', 'rebuild the Docco documentation', (options) ->
  layout = options.layout or 'linear'
  run_Task = ()->
    console.time('docco built in')
    commands =  [ "node_modules/.bin/docco --layout #{layout} {#{srcFolder},test}/{**/*,*}"]
                  #"node_modules/.bin/docco --layout #{layout} #{srcFolder}/**/**.**"
                  #"node_modules/.bin/docco --layout #{layout} #{srcFolder}/**.**"]
                  #"sed \"s/docco.css/resources\\/#{layout}\\/docco.css/\" < docs/docco.html > index.html"
                  #'rm -r docs']

    execResult = (err,stdout) ->
      throw err if err
      console.log stdout if options.verbose

    (exec commands.join(' && '), execResult).on 'exit', ->
      console.timeEnd 'docco built in'
      if (options.publish)
        console.time 'Committed and published to github in'
        commands =  [ "cd docs"
                      "git add ."
                      "git commit -m 'auto docs commit from cakefile' "
                      "git push origin gh-pages:gh-pages"
                      "cd .."]

        (exec commands.join(' && '), execResult)
          .on 'exit', (code)->
            if (code is 0)
              console.timeEnd 'Committed and published to github in'

  if (options.watch)
    console.log "Watching folder: #{srcFolder}"
    fs.watch srcFolder, ()->
        console.log "Folder watch on #{srcFolder} triggered"
        run_Task()

  process.on 'uncaughtException', (err)->
    console.log err.toString() if err.toString() isnt 'Error: Command failed: ' #happens when ```git commit -m ``` is executed when no changes exist


  run_Task()
