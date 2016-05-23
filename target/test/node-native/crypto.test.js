// Generated by CoffeeScript 1.10.0
(function() {
  require('../../src/fluentnode');

  describe('| crypo', function() {
    var value;
    value = "abc123";
    it('add_Random_Chars', function() {
      return using(value, function() {
        this.add_Random_Chars(1).size().assert_Is(value.size().add(1));
        this.add_Random_Chars().size().assert_Above(value.size().add(5));
        return this.add_Random_Chars(100).size().assert_Above(value.size().add(80));
      });
    });
    it('add_Random_String', function() {
      return using(value, function() {
        this.add_Random_String().size().assert_Is(value.size().add(10));
        this.add_Random_String(1).size().assert_Is(value.size().add(1));
        return this.add_Random_String(100).size().assert_Is(value.size().add(100));
      });
    });
    it('add_Random_Letters', function() {
      var char, charSet_Letters, charSet_Numbers, i, len, randomLetters, results;
      value.add_Random_Letters(5).size().assert_Is(value.size().add(5));
      randomLetters = "".add_Random_Letters(5);
      charSet_Numbers = '0123456789';
      charSet_Letters = 'abcdefghijklmnopqrstuvwxyz';
      results = [];
      for (i = 0, len = randomLetters.length; i < len; i++) {
        char = randomLetters[i];
        (function() {
          return charSet_Numbers.assert_Contains(char);
        }).assert_Throws();
        results.push((function() {
          return charSet_Letters.assert_Contains(char);
        }).assert_Not_Throws());
      }
      return results;
    });
    it('add_5_Random_Letters', function() {
      value.add_5_Random_Letters().size().assert_Is(value.size().add(5));
      value.add_5_Letters().size().assert_Is(value.size().add(5));
      return ''.add_5_Random_Letters.assert_Is(''.add_5_Letters);
    });
    it('add_Random_Numbers', function() {
      var char, charSet_Letters, charSet_Numbers, i, len, randomNumbers, results;
      value.add_Random_Numbers(5).size().assert_Is(value.size() + 5);
      "".add_Random_Numbers(500).size().assert_Is(500);
      randomNumbers = "".add_Random_Numbers(5);
      charSet_Numbers = '0123456789';
      charSet_Letters = 'abcdefghijklmnopqrstuvwxyz';
      results = [];
      for (i = 0, len = randomNumbers.length; i < len; i++) {
        char = randomNumbers[i];
        (function() {
          return charSet_Numbers.assert_Contains(char);
        }).assert_Not_Throws();
        results.push((function() {
          return charSet_Letters.assert_Contains(char);
        }).assert_Throws());
      }
      return results;
    });
    it('random_String', function() {
      0..random_String().size().assert_Is_Equal_To(10);
      1..random_String().size().assert_Is_Equal_To(1);
      return 1..random_String().assert_Size_Is(1);
    });
    return it('random_Letters', function() {
      return 10..random_Letters().size().assert_Is_Equal_To(10);
    });
  });

}).call(this);