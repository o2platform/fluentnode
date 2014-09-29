fs = require('fs')

String::fileExists  = -> fs.existsSync  @.toString()
String::files       = -> fs.readdirSync @.toString()