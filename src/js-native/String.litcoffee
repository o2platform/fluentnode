Methods that extend the native Javascript String class

Here is the list of 'default' String global objects:
[Global_Objects/String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)

Note that there are more String Extension Methods (they exist inside their main dependency: crypto, path, fs)

methods

twin methods: add

@.**append** value

    String::append = (value)->
        @ + if value then value else ''

    String::add = String::append

@.**after** value

    String::after = (value)->
      if ((index = @.indexOf(    value)) == -1 )
        ''
      else
        @.substr(index + value.size())

@.**after_Last** value

    String::after_Last = (value)->
      if ((index = @.lastIndexOf(value)) == -1 )
        ''
      else
        @.substr(index + value.size())

@.**before** value

    String::before = (value)->
      @.substring(0,@.indexOf(value))

@.**before_Last** value

    String::before_Last = (value)->
      @.substring(0,@.lastIndexOf(value))

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
          if @.indexOf(item) is -1
            return false
        return true
      @.indexOf(value) > -1

@.**ends_With** value

    String::ends_With = (value)->
      if not value
        false
      else
        @.valueOf().slice(-value.length) is value


@.**is** value

Returns true if ```@``` is equal to ```value```

    String::is = (value)->
      @.valueOf() is value

@.**is_Not** value

Returns true if ```@``` is NOT equal to ```value```

twin methods: isnt

    String::is_Not = (value)->
      @.valueOf() isnt value

    String::isnt = String::is_Not

@.**lines**

returns @ split by '/n'

twin methods: split_Lines

    String::lines = ()->
      @.split(/\r\n|[\n\r\u0085\u2028\u2029]/g)

    String::split_Lines = String::lines

@.**lower**

returns @ in lowercase

    String::lower = ()->
      @.toLowerCase()

@.**not_Contains** value

    String::not_Contains  = (value)->
      @.indexOf(value) == -1

@.**only_Letters**

Returns a string where all chars that are not an letter (uppper or lower case) are replaced
with a - (dash)

The letters capitalization is not modified

    String::only_Letters =
      ()-> @.replace(/[^a-zA-Z]/gi, '-')

@.**only_Numbers**

Returns a string where all chars that are not an number are replaced
with a - (dash)

    String::only_Numbers = ()->
      @.replace(/[^0-9]/gi, '-').lower()

@.**remove** value

Removes all instances of **value**

Note: ```@.replace(value,'')``` doesn't work because it
only removes the first occurance

    String::remove = (value)->

      result = @
      while result.contains(value)
        result = result.replace(value,'')
      result

@.**repeat** value

Repeats @ ```value``` times

Note: the implementation uses a while loop in order to handle ok cases when
value is negative or weird

    String::repeat = (value)->
      result = ''
      if typeof(value) is 'number'
        while value > 0
          result += @
          value--
      return result

@.**size**

    String::size = ()->
      @.length

@.**starts_With** value

    String::starts_With = (value)->
      if not value
        false
      else
        @.valueOf().slice(0,value.length) is value

@.**to_Safe_String**

Returns a string where all chars that are dont match the regex are replaced
with a - (dash)

The current regex allows
- lowercase letters
- uppercase letters
- numbers
- the chars: , - _  (comma, dash and underscore)

The letters capitalization is modified, with the returned string being converted
into lowercase

    String::to_Safe_String = ()->
      @.replace(/[^a-zA-Z0-9.\-_]/gi, '-').lower()

@.**trim**

    String::trim = ()->
      @.replace(/^\s+|\s+$/g, '')

@.**twice**

    String::twice = ()->
      @ + @

@.**upper**

    String::upper = ()->
      @.toUpperCase()

@.**json_Parse**

returns the object representation of the the json string @

Note: if there is a prob parsing the json an empty object will be returned (use **json_Valid** to check for well formed json)

    String::json_Parse = ()->
      try
        JSON.parse(@)
      catch
        {}

@.**json_Valid**

Returns true if @ can be deserialised ok into a json object

    String::json_Valid = ()->
      try
        JSON.parse(@)
        true
      catch
        false

---
back to [index](index.html)
