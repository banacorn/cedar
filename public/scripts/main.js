(function() {
  var viewport;

  $(function() {
    var socket;
    viewport.init();
    socket = io.connect();
    return socket.on('ls', function(data) {
      return console.log(data);
    });
  });

  viewport = (function() {
    var onResize, resizeMain, width;
    width = 0;
    resizeMain = function() {
      return $('#main').width(width - 200);
    };
    onResize = function(cb) {
      return $(window).resize(function() {
        return cb();
      }).resize();
    };
    return {
      init: function() {
        return onResize(function() {
          width = $(this).width();
          return resizeMain();
        });
      }
    };
  })();

}).call(this);
