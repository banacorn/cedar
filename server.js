(function() {
  var express, io, server;

  express = require('express');

  server = express.createServer();

  io = require('socket.io').listen(server);

  server.configure(function() {
    return server.use(express.static(__dirname + '/public'));
  });

  server.configure('development', function() {
    return server.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });

  server.configure('production', function() {
    return server.use(express.errorHandler());
  });

  server.listen(4000);

  console.log('Express server listening on port %d in %s mode', 4000, server.settings.env);

  module.exports = {
    server: server,
    io: io
  };

}).call(this);
