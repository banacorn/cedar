(function() {
  var PATH, fs, io;

  io = require('./server').io;

  fs = require('./fs');

  PATH = '~/node';

  io.sockets.on('connection', function(socket) {
    return fs.ls(PATH, function(error, stdout) {
      return socket.emit('ls', stdout);
    });
  });

}).call(this);
