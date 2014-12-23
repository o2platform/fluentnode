back to [main](fluent.html)

    Function::ctor   = (params...)-> new @(params...)
    Function::invoke = (params...)-> @.apply(null, params)    # not sure where to the the this reference for the apply

    Function::new = Function::ctor