Object::str          = -> @.toString()
Object::json         = -> JSON.stringify(@)
Object::json_pretty  = -> JSON.stringify(@,null,'  ')
Object::json_inspect = -> require('util').inspect(@)