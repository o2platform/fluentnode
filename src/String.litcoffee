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

@.**lower**

returns @ in lowercase

    String::lower = ()->
      @.toLowerCase()

@.**not_Contains** value

    String::not_Contains  = (value)->
      @.indexOf(value) == -1



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

    String::to_Safe_String = ()->
      @.replace(/[^a-z0-9.\-_]/gi, '-').lower()

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

    String::json_Parse = ()->
      JSON.parse(@)

---
back to [index](index.html)
