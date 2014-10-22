crypto = require('crypto')

String::append            = (stringToAppend)-> @ + if stringToAppend then stringToAppend else ''
String::add_Random_Chars  = (size          )-> @ + crypto.randomBytes(size)
String::add_Random_String = (size          )-> @ + crypto.randomBytes(size).toString('hex').slice(0,size)
String::size              = ()              -> @.length