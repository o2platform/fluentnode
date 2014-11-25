crypto = require('crypto')

String::append               = (stringToAppend)-> @ + if stringToAppend then stringToAppend else ''
String::add_Random_Chars     = (size          )-> @ + crypto.randomBytes(size || 10)
String::add_Random_String    = (size          )-> @ + crypto.randomBytes(size || 10).toString('hex').slice(0,size|| 10)
String::add_Random_Letters   = (size          )->
                                                  charSet = 'abcdefghijklmnopqrstuvwxyz'
                                                  @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

String::add_5_Random_Letters = ()              -> @.add_Random_Letters(5)
String::add_Random_Numbers   = (size          )->
                                                  charSet = '0123456789'
                                                  @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

String::contains             = (value         )-> @.indexOf(value) > -1

String::ends_With            = (value)         -> if not value then false else @.toString().slice(-value.length)==value
String::lower                = ()              -> @.toLowerCase()
String::not_Contains         = (value         )-> @.indexOf(value) == -1
String::size                 = ()              -> @.length
String::starts_With          = (value)         -> if not value then false else @.toString().slice(0,value.length)==value
String::trim                 = ()              -> @.replace(/^\s+|\s+$/g, '')
String::upper                = ()              -> @.toUpperCase()


