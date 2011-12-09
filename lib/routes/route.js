(function() {
  var file, get, put, static;

  file = require('../file').file;

  static = function(req, res) {
    return res.sendfile("lib/public" + req.url);
  };

  get = function(req, res) {
    if (!req.xhr) {
      return res.sendfile("lib/public/index.html");
    } else {
      console.log(file[req.url]);
      return res.json(file[req.url]);
    }
  };

  put = function(req, res) {
    if (!req.xhr) {
      return res.sendfile("lib/public/index.html");
    } else {
      console.log('XHR');
      return res.json(file);
    }
  };

  exports.static = static;

  exports.get = get;

  exports.put = put;

}).call(this);
