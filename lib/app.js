(function() {
  var app, express, routes;

  express = require('express');

  routes = require('./routes/route');

  app = module.exports = express.createServer();

  app.configure(function() {
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(app.router);
    return app.use(express.static("" + __dirname + "/public"));
  });

  app.configure('development', function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });

  app.configure('production', function() {
    return app.use(express.errorHandler());
  });

  app.get('/favicon.ico', routes.static);

  app.get('/images/*', routes.static);

  app.get('/stylesheets/*', routes.static);

  app.get('/scripts/*', routes.static);

  app.get('/*', routes.get);

  app.put('/*', routes.put);

  app.listen(4000);

  console.log("Express server listening on port " + (app.address().port) + " in " + app.settings.env + " mode");

}).call(this);
