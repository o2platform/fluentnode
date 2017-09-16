// Generated by CoffeeScript 1.12.7
(function() {
  String.prototype.append = function(value) {
    return this + (value ? value : '');
  };

  String.prototype.add = String.prototype.append;

  String.prototype.after = function(value) {
    var index;
    if ((index = this.indexOf(value)) === -1) {
      return '';
    } else {
      return this.substr(index + value.size());
    }
  };

  String.prototype.after_Last = function(value) {
    var index;
    if ((index = this.lastIndexOf(value)) === -1) {
      return '';
    } else {
      return this.substr(index + value.size());
    }
  };

  String.prototype.before = function(value) {
    return this.substring(0, this.indexOf(value));
  };

  String.prototype.before_Last = function(value) {
    return this.substring(0, this.lastIndexOf(value));
  };

  String.prototype.contains = function(value) {
    var i, item, len, regex;
    if (value instanceof RegExp) {
      regex = new RegExp(value);
      return regex.exec(this) !== null;
    }
    if (value instanceof Array) {
      for (i = 0, len = value.length; i < len; i++) {
        item = value[i];
        if (this.indexOf(item) === -1) {
          return false;
        }
      }
      return true;
    }
    return this.indexOf(value) > -1;
  };

  String.prototype.ends_With = function(value) {
    if (!value) {
      return false;
    } else {
      return this.valueOf().slice(-value.length) === value;
    }
  };

  String.prototype.is = function(value) {
    return this.valueOf() === value;
  };

  String.prototype.is_Not = function(value) {
    return this.valueOf() !== value;
  };

  String.prototype.isnt = String.prototype.is_Not;

  String.prototype.line = function() {
    return String(this) + "\n";
  };

  String.prototype.lines = function() {
    return this.split(/\r\n|[\n\r\u0085\u2028\u2029]/g);
  };

  String.prototype.split_Lines = String.prototype.lines;

  String.prototype.lower = function() {
    return this.toLowerCase();
  };

  String.prototype.not_Contains = function(value) {
    return this.indexOf(value) === -1;
  };

  String.prototype.not_Starts_With = function(value) {
    return this.starts_With(value) === false;
  };

  String.prototype.only_Letters = function() {
    return this.replace(/[^a-zA-Z]/gi, '-');
  };

  String.prototype.only_Numbers = function() {
    return this.replace(/[^0-9]/gi, '-').lower();
  };

  String.prototype.remove = function(value) {
    var result;
    result = this;
    while (result.contains(value)) {
      result = result.replace(value, '');
    }
    return result;
  };

  String.prototype.repeat = function(value) {
    var result;
    result = '';
    if (typeof value === 'number') {
      while (value > 0) {
        result += this;
        value--;
      }
    }
    return result;
  };

  String.prototype.size = function() {
    return this.length;
  };

  String.prototype.starts_With = function(value) {
    if (!value) {
      return false;
    } else {
      return this.valueOf().slice(0, value.length) === value;
    }
  };

  String.prototype.to_Safe_String = function() {
    return this.replace(/[^a-zA-Z0-9.\-_]/gi, '-').lower();
  };

  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, '');
  };

  String.prototype.twice = function() {
    return this + this;
  };

  String.prototype.upper = function() {
    return this.toUpperCase();
  };

  String.prototype.json_Parse = function() {
    try {
      return JSON.parse(this);
    } catch (error) {
      return {};
    }
  };

  String.prototype.json_Valid = function() {
    try {
      JSON.parse(this);
      return true;
    } catch (error) {
      return false;
    }
  };

  String.prototype.is_Local_Url = function() {
    var url;
    url = this.url_Decode();
    if ((url != null) && url.length > 0) {
      return (url[0] === '/' && (url.length === 1 || (url[1] !== '/' && url[1] !== '\\'))) || (url.length > 1 && url[0] === '~' && url[1] === '/');
    } else {
      return false;
    }
  };

}).call(this);
