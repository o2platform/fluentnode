// Generated by CoffeeScript 1.12.7
(function() {
  String.prototype.http_POST = function(req_Data, callback) {
    var options;
    options = {
      method: 'POST',
      data: req_Data,
      'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Length': Buffer.byteLength(req_Data, 'utf8')
    };
    return this.http_With_Options(options, callback);
  };

  String.prototype.POST = function(req_Data, callback) {
    return this.http_POST(req_Data, function(error, data, res) {
      return callback(data);
    });
  };

}).call(this);
