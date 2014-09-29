Object::str          = -> @.toString()
Object::json         = -> JSON.stringify(@)
Object::json_inspect = -> require('util').inspect(@)