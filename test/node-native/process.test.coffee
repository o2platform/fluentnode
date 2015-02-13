require('../../src/fluentnode')

describe 'process',->
    it 'start_Process', ->
        ''.start_Process.assert_Is_Function()
        'echo'.start_Process().assert_Is_Object()
                            .constructor.name.assert_Is('ChildProcess')
        'echo'.start_Process().pid.assert_Is_Number()
    
    it 'start_Process_Redirect_Console', (done)->
        original_log = console.log
        log_Messages = []
        console.log  = (logMsg)-> log_Messages.push(logMsg)
        
        childProcess = 'ls'.start_Process_Redirect_Console('.')
        childProcess.on 'exit', ->
            console.log 'process ended'
            log_Messages.first() .assert_Contains('README.md')
            log_Messages.second().assert_Is('process ended')
            console.log = original_log
            done()
    
    it 'String::start_Process_Capture_Console_Out', (done)->
        
        runTest = (testData,next)->
            name          = testData.process_Name
            parameter     = testData.process_Parameter
            expected_Data = testData.expected_Data
            name.start_Process_Capture_Console_Out parameter, (data)->
                data.assert_Is(expected_Data)
                next()
        
        runTests = (testsData, next)->
            if testsData.empty() 
                next() 
            else 
                runTest testsData.pop(), ()-> runTests(testsData, next)
        
        testsData = [
                        {process_Name: 'echo' , process_Parameter: 'hello'       , expected_Data:'hello\n' }
                        {process_Name: 'echo' , process_Parameter: ['hello','me'], expected_Data:'hello,me\n' }
                        {process_Name: 'echo' , process_Parameter: []            , expected_Data:'\n' }
                        {process_Name: 'echo' , process_Parameter: [null]        , expected_Data:'\n' }
                        {process_Name: 'git'  , process_Parameter: ['xyz'       ], expected_Data:'git: \'xyz\' is not a git command. See \'git --help\'.\n' }
                        #travis and cloud9 sometimes failed on a couple of these (not in an consistent/repeatable way)
                        #{process_Name: 'ls'   , process_Parameter: '.'           , expected_Data:'Cakefile\nLICENSE\nREADME.md\ndocs\npackage.json\nsrc\ntest\n' }
                        #{process_Name: 'ls'   , process_Parameter: null          , expected_Data:'ls: null: No such file or directory\n' }
                    ]    
        
        runTests(testsData, done)