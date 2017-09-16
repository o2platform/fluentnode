// Generated by CoffeeScript 1.12.7
(function() {
  var Server, http, https, url;

  http = require('http');

  https = require('https');

  url = require('url');

  Server = http.Server;

  Server.prototype.add_Sockets_Close_Suport = function() {
    this._sockets = {};
    this._socket_Count = 0;
    this.on('connection', (function(_this) {
      return function(socket) {
        var socket_id;
        socket_id = _this._socket_Count++;
        _this._sockets[socket_id] = socket;
        return socket.on('close', function() {
          return delete _this._sockets[socket_id];
        });
      };
    })(this));
    return this;
  };

  Server.prototype.close_And_Destroy_Sockets = function(callback) {
    var socket_Id;
    if (this._sockets !== void 0) {
      for (socket_Id in this._sockets) {
        this._sockets[socket_Id].destroy();
        delete this._sockets[socket_Id];
      }
    }
    return this.close(function() {
      if (callback) {
        return callback();
      }
    });
  };

  Server.prototype.listen_OnPort_Saying = function(port, text, callback) {
    var ip;
    ip = '127.0.0.1';
    return this.respond_With_String_As_Text(text).add_Sockets_Close_Suport().listen(port, ip, function() {
      return callback();
    });
  };

  Server.prototype.respond_With_Request_Headers = function(value) {
    var simple_Response;
    delete this._events.request;
    simple_Response = function(req, res) {
      res.writeHead(200, {
        'Content-Type': 'application/json'
      });
      return res.end(req.headers.json_Str());
    };
    this.addListener('request', simple_Response);
    return this;
  };

  Server.prototype.respond_With_Request_Url = function(value) {
    var simple_Response;
    delete this._events.request;
    simple_Response = function(req, res) {
      var data;
      res.writeHead(200, {
        'Content-Type': 'application/json'
      });
      data = {
        url: req.url
      };
      return res.end(data.json_Str());
    };
    this.addListener('request', simple_Response);
    return this;
  };

  Server.prototype.respond_With_String_As_Text = function(value) {
    var simple_Response;
    delete this._events.request;
    simple_Response = function(req, res) {
      res.writeHead(200, {
        'Content-Type': 'text/plain'
      });
      return res.end(value);
    };
    this.addListener('request', simple_Response);
    return this;
  };

  Server.prototype.respond_With_Object_As_Json = function(value) {
    var json_Response;
    delete this._events.request;
    json_Response = function(req, res) {
      res.writeHead(200, {
        'Content-Type': 'application/json'
      });
      return res.end(value.json_Str());
    };
    this.addListener('request', json_Response);
    return this;
  };

  Server.prototype.respond_With_Request_Object = function() {
    var json_Response;
    delete this._events.request;
    json_Response = function(req, res) {
      res.writeHead(200, {
        'Content-Type': 'application/json'
      });
      return res.end(req.json_Inspect());
    };
    this.addListener('request', json_Response);
    return this;
  };

}).call(this);
