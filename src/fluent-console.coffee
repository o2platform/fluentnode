Object::console_log = ->
                            value = @.toString()    # Dinis: I'm still not sure why this is needed
                            console.log(value)
                            return value
Object::log         = Object::console_log