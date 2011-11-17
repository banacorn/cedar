(function() {
  var exec, ls, util;

  util = require('util');

  exec = require('child_process').exec;

  ls = function(path, cb) {
    return exec('ls ' + path, cb);
  };

  module.exports = {
    ls: ls
  };

}).call(this);
