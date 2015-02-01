Adds helper methods to the native javascript Function class


**Function::ctor** params...

Creates a new object from the parent function

    Function::ctor   = (params...)->
        new @(params...)

**Function::invoke** params...

Invokes the function with the provided params. Note that the this object is set to null

    Function::invoke = (params...)->
        @.apply(null, params)


**Function::invoke_In** value

Invokes the function in ```value``` miliseconds

    Function::invoke_In = (value)->
        setTimeout @, value


**Function::new** params ...

    Function::new    = Function::ctor


**Function::sourceCode**

Returns the source code of the current function. This done using an easy trick which is usually not that obvious.
All we have to do is to call the .toString() method of the function (another option is to append the function to a string ```@ + ""```)

twin methods: sourceCode

    Function::source_Code = ()->
        @.toString()

    Function::sourceCode = Function::source_Code

---
back to [index](index.html)
