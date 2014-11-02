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

String::lower                = ()              -> @.toLowerCase()
String::size                 = ()              -> @.length
String::upper                = ()              -> @.toUpperCase()
