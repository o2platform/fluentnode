// Generated by CoffeeScript 1.8.0
(function() {
  var __slice = [].slice;

  Function.prototype.ctor = function() {
    var params;
    params = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return (function(func, args, ctor) {
      ctor.prototype = func.prototype;
      var child = new ctor, result = func.apply(child, args);
      return Object(result) === result ? result : child;
    })(this, params, function(){});
  };

  Function.prototype.invoke = function() {
    var params;
    params = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return this.apply(null, params);
  };

  Function.prototype.invoke_In = function(value) {
    return setTimeout(this, value);
  };

  Function.prototype["new"] = Function.prototype.ctor;

  Function.prototype.source_Code = function() {
    return this.toString();
  };

  Function.prototype.sourceCode = Function.prototype.source_Code;

}).call(this);
