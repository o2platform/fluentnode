// Generated by CoffeeScript 1.10.0
(function() {
  var crypto;

  crypto = require('crypto');

  String.prototype.add_Random_Chars = function(size) {
    return this + crypto.randomBytes(size || 10);
  };

  String.prototype.add_Random_String = function(size) {
    return this + crypto.randomBytes(size || 10).toString('hex').slice(0, size || 10);
  };

  String.prototype.add_Random_Letters = function(size) {
    var charSet, i;
    charSet = 'abcdefghijklmnopqrstuvwxyz';
    return this + ((function() {
      var j, ref, results;
      results = [];
      for (i = j = 1, ref = size; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
        results.push(charSet[Math.floor(Math.random() * charSet.length)]);
      }
      return results;
    })()).join('');
  };

  String.prototype.add_5_Random_Letters = function() {
    return this.add_Random_Letters(5);
  };

  String.prototype.add_5_Letters = String.prototype.add_5_Random_Letters;

  String.prototype.add_Random_Numbers = function(size) {
    var charSet, i;
    charSet = '0123456789';
    return this + ((function() {
      var j, ref, results;
      results = [];
      for (i = j = 1, ref = size; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
        results.push(charSet[Math.floor(Math.random() * charSet.length)]);
      }
      return results;
    })()).join('');
  };

  String.prototype.checksum = function(algorithm, encoding) {
    return crypto.createHash(algorithm || 'md5').update(this.toString(), 'utf8').digest(encoding || 'hex');
  };

  Number.prototype.random_String = function() {
    return "".add_Random_String(this + 0);
  };

  Number.prototype.random_Letters = function() {
    return "".add_Random_Letters(this + 0);
  };

}).call(this);