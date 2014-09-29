String::console_log = ->
                            value = @.toString()    # Dinis: I'm still not sure why this is needed
                            console.log(value)
                            return value
String::log         = String::console_log