// Generated by CoffeeScript 1.10.0
(function() {
  Number.prototype.add = function(value) {
    if (is_Number(value)) {
      return this + value;
    } else {
      return this;
    }
  };

  Number.prototype.dec = function(value) {
    if (is_Number(value)) {
      return this - value;
    } else {
      return this - 1;
    }
  };

  Number.prototype.in_Between = function(min, max) {
    return (min < this && this < max);
  };

  Number.prototype.inc = function(value) {
    if (is_Number(value)) {
      return this + value;
    } else {
      return this + 1;
    }
  };

  Number.prototype.invoke_After = function(callback) {
    if (callback instanceof Function) {
      return setTimeout(callback, this);
    }
  };

  Number.prototype.wait = Number.prototype.invoke_After;

  Number.prototype.is_Number = function() {
    return this instanceof Number && this.str().is_Not('NaN');
  };

  Number.prototype.log = function() {
    return console.log(this.toString());
  };

  Number.prototype.random = function() {
    return ~~(Math.random() * this);
  };

}).call(this);