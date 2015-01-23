Methods that extend the native Javascript String class

dependencies

    crypto = require('crypto')

methods

@.**append** value

    String::append = (value)->
        @ + if value then value else ''

@.**add_Random_Chars** size

    String::add_Random_Chars     = (size )-> @ + crypto.randomBytes(size || 10)

@.**add_Random_String** size
    
    String::add_Random_String    = (size )-> @ + crypto.randomBytes(size || 10).toString('hex').slice(0,size|| 10)

@.**add_Random_Letters** size    
    
    String::add_Random_Letters   = (size )->
                                             charSet = 'abcdefghijklmnopqrstuvwxyz'
                                             @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

@.**add_5_Random_Letters** 
                                             
    String::add_5_Random_Letters = (     )-> @.add_Random_Letters(5)

@.**add_Random_Numbers** size     
    
    String::add_Random_Numbers   = (size )->
                                             charSet = '0123456789'
                                             @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

@.**after** value
                                             
    String::after                = (value)-> if ((index = @.indexOf(    value)) == -1 ) then '' else @.substr(index + value.size())
    
@.**after_Last** value  
    
    String::after_Last           = (value)-> if ((index = @.lastIndexOf(value)) == -1 ) then '' else @.substr(index + value.size())
    
@.**before** value
    
    String::before               = (value)-> @.substring(0,@.indexOf(value))

@.**before_Last** value

    String::before_Last          = (value)-> @.substring(0,@.lastIndexOf(value))

@.**contains** value

Checks that ```value``` is inside @.

If ```value``` is an Array, then all elements are expected to be found inside @

If ```value``` is an RegExp then checks if it matches @


    String::contains = (value)->
        if value instanceof RegExp
            regex = new RegExp(value)
            return regex.exec(@) isnt null
        if value instanceof Array
            for item in value
                if @.indexOf(item) == -1
                    return false
            return true
        @.indexOf(value) > -1


    String::ends_With            = (value)-> if not value then false else @.toString().slice(-value.length)==value
    String::lower                = (     )-> @.toLowerCase()
    String::not_Contains         = (value)-> @.indexOf(value) == -1
    String::size                 = (     )-> @.length
    String::starts_With          = (value)-> if not value then false else @.toString().slice(0,value.length)==value
    String::trim                 = (     )-> @.replace(/^\s+|\s+$/g, '')
    String::upper                = (     )-> @.toUpperCase()

---
back to [index](index.html)
