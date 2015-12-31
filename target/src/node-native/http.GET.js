// Generated by CoffeeScript 1.10.0
(function() {
  var Server, base, http, https, url;

  http = require('http');

  https = require('https');

  url = require('url');

  Server = http.Server;

  if (global.__fluentnode == null) {
    global.__fluentnode = {};
  }

  if ((base = global.__fluentnode).http == null) {
    base.http = {};
  }

  using(global.__fluentnode.http, function() {
    this.HTTP_GET_TIMEOUT = 500;
    return this.HTTP_GET_DELAY = 10;
  });

  String.prototype.http_GET = function(callback) {
    var engine, req;
    url = url.parse(this.str());
    engine = url.protocol === 'https:' ? https : http;
    req = engine.get(this.str(), function(res) {
      var data;
      data = '';
      res.on('data', function(chunk) {
        return data += chunk;
      });
      return res.on('end', function() {
        return callback(null, data, res);
      });
    });
    req.on('error', function(err) {
      if (callback) {
        return callback(err, null, null);
      }
    });
    return req;
  };

  String.prototype.GET = function(callback) {
    return this.http_GET(function(error, data, res) {
      return callback(data);
    });
  };

  String.prototype.GET_Json = function(callback) {
    return this.http_GET(function(error, data, res) {
      if (data) {
        return callback(data.json_Parse());
      } else {
        return callback({});
      }
    });
  };

  String.prototype.json_GET = String.prototype.GET_Json;

  String.prototype.json_GET_With_Timeout = function(callback) {
    return this.http_GET_With_Timeout(function(data) {
      if (data) {
        return callback(data.json_Parse());
      } else {
        return callback({});
      }
    });
  };

  String.prototype.http_GET_Wait_For_Null = function(callback) {
    var attempts, delay, run_Tests, timeout, try_Http_Get;
    timeout = global.__fluentnode.http.HTTP_GET_TIMEOUT;
    delay = global.__fluentnode.http.HTTP_GET_DELAY;
    attempts = ~~(timeout / delay);
    try_Http_Get = (function(_this) {
      return function(next) {
        return _this.GET(function(data) {
          if (data) {
            return next.invoke_In(delay);
          } else {
            return callback(null);
          }
        });
      };
    })(this);
    run_Tests = (function(_this) {
      return function(count) {
        if (count) {
          return try_Http_Get(function() {
            return run_Tests(count - 1);
          });
        } else {
          return callback(new Error("[http_GET_Wait_For_Null] never got a null from server " + _this + " after " + attempts + " attempts"));
        }
      };
    })(this);
    return run_Tests(attempts);
  };

  String.prototype.http_GET_With_Timeout = function(callback) {
    var attempts, delay, run_Tests, timeout, try_Http_Get;
    timeout = global.__fluentnode.http.HTTP_GET_TIMEOUT;
    delay = global.__fluentnode.http.HTTP_GET_DELAY;
    attempts = ~~(timeout / delay);
    try_Http_Get = (function(_this) {
      return function(next) {
        return _this.GET(function(data) {
          if (data) {
            return callback(data);
          } else {
            return delay.invoke_After(next);
          }
        });
      };
    })(this);
    run_Tests = (function(_this) {
      return function(count) {
        if (count) {
          return try_Http_Get(function() {
            return run_Tests(count - 1);
          });
        } else {
          return callback(null);
        }
      };
    })(this);
    return run_Tests(attempts);
  };

}).call(this);
