#These Object prototypes have to be written using Object.defineProperty so that we can set the 
# enumerable value to false (otherwise 'for item of xyz' would include these methods)
Object.defineProperty Object.prototype, 'str', 
    enumerable  : false,  
    writable    : true,     
    value: ->
        return @.toString()
    
Object.defineProperty Object.prototype, 'json',
    enumerable  : false,  
    writable    : true,
    value: ->
        return JSON.stringify(@)
    
Object.defineProperty Object.prototype, 'json_pretty',
    enumerable  : false,  
    writable    : true,
    value: ->
        return JSON.stringify(@,null,'  ')

Object.defineProperty Object.prototype, 'json_inspect',
    enumerable  : false,  
    writable    : true,
    value: ->
        return require('util').inspect(@)

#This is how they were done originally (which broke a lot of things)
#Object::str          = -> @.toString()
#Object::json         = -> JSON.stringify(@)
#Object::json_pretty  = -> JSON.stringify(@,null,'  ')
#Object::json_inspect = -> require('util').inspect(@)
