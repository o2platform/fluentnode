crypto = require('crypto')

String::append               = (stringToAppend)-> @ + if stringToAppend then stringToAppend else ''
String::add_Random_Chars     = (size          )-> @ + crypto.randomBytes(size || 10)
String::add_Random_String    = (size          )-> @ + crypto.randomBytes(size || 10).toString('hex').slice(0,size|| 10)
String::add_5_Random_Letters = ()              -> @.add_Random_String(5)
String::size                 = ()              -> @.length