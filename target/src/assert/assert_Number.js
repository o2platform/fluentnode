// Generated by CoffeeScript 1.10.0
(function() {
  var assert;

  assert = require('assert');

  Number.prototype.assert_Bigger_Than = function(value) {
    value.assert_Is_Number();
    return (this > value).assert_Is_True(this + " was not bigger than " + value);
  };

  Number.prototype.assert_Above = Number.prototype.assert_Bigger_Than;

  Number.prototype.assert_Is_Bigger_Than = Number.prototype.assert_Bigger_Than;

  Number.prototype.assert_In_Between = function(min, max) {
    var message;
    message = "Expected " + this + " to be between " + min + " and " + max;
    this.in_Between(min, max).assert_Is_True(message);
    return this;
  };

  Number.prototype.assert_Is_Equal_To = function(target) {
    var source;
    source = this;
    assert.equal(source, target);
    return this;
  };

  Number.prototype.assert_Is_Not_Equal_To = function(target, message) {
    var source;
    source = this;
    assert.notEqual(source, target, message);
    return this;
  };

  Number.prototype.assert_Is_Number = function() {
    this.str().assert_Is_Not('NaN', 'The provided number was a NaN (Not an Number)');
    return this;
  };

  Number.prototype.assert_Is = Number.prototype.assert_Is_Equal_To;

  Number.prototype.assert_Is_Not = Number.prototype.assert_Is_Not_Equal_To;

  Number.prototype.assert_Smaller_Than = function(value) {
    return (this < value).assert_Is_True();
  };

}).call(this);