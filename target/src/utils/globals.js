// Generated by CoffeeScript 1.8.0
(function() {
  global.existy = function(value) {
    return value != null;
  };

  global.not_Null = global.existy;

  global.is_Number = function(value) {
    return (typeof value === 'number') && value.is_Number();
  };

  global.is_Null = function(value) {
    return value === null;
  };

  global.file_Exists = function(file) {
    if (not_Null(file)) {
      return file.file_Exists();
    } else {
      return false;
    }
  };

  global.using = function(target, callback) {
    return callback.apply(target);
  };

  global.truthly = function(value) {
    return (value != null) && value !== false;
  };

  global.log = console.log;

}).call(this);
