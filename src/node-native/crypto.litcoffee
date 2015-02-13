Methods that use the node crypto API

dependencies

    crypto = require('crypto')

@.**add_Random_Chars** size

    String::add_Random_Chars = (size )->
      @ + crypto.randomBytes(size || 10)

@.**add_Random_String** size

    String::add_Random_String = (size )->
      @ + crypto.randomBytes(size || 10).toString('hex').slice(0,size|| 10)

@.**add_Random_Letters** size

    String::add_Random_Letters   = (size )->
      charSet = 'abcdefghijklmnopqrstuvwxyz'
      @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

@.**add_5_Random_Letters**

Adds 5 random letters to ```@```

twin methods: add_5_Letters

    String::add_5_Random_Letters = ()->
      @.add_Random_Letters(5)


    String::add_5_Letters = String::add_5_Random_Letters

@.**add_Random_Numbers** size

    String::add_Random_Numbers = (size)->
      charSet = '0123456789'
      @ + (charSet[Math.floor(Math.random() * charSet.length)]  for i in [1..size]).join('')

@.**random_String** ()

Returns a random string of size @ made of ascii chars

    Number::random_String = ->
      "".add_Random_String(@ + 0)


@.**random_Letters** ()

Returns a random string of size @ made of only letters

    Number::random_Letters = ->
      "".add_Random_Letters(@ + 0)

