Array::empty  = -> @.length == 0

Array::first  = -> if(@.length    ) then return @[0] else return null
    
Array::second = -> if(@.length > 1) then return @[1] else return null
    
Array::third  = -> if(@.length > 2) then return @[2] else return null
    
Array::fourth = -> if(@.length > 3) then return @[3] else return null

Array::last   = -> if(@.length    ) then return @[@.length-1] else return null

Array::size   = -> return @.length

Array::contains      = (value)-> (value in @)
Array::not_Contains  = (value)-> (value not in @)