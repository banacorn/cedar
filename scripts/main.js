(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  require.config({
    paths: {
      jquery: 'lib/jquery-1.7.1.min',
      underscore: 'lib/underscore-min',
      backbone: 'lib/backbone-amd-min'
    }
  });

  require(['jquery', 'underscore', 'backbone', 'view/container'], function($, _, Backbone, Container) {
    var Router, project;
    project = (function() {
      var Collection, Model, public;
      Model = (function() {

        __extends(Model, Backbone.Model);

        function Model() {
          Model.__super__.constructor.apply(this, arguments);
        }

        return Model;

      })();
      Collection = (function() {

        __extends(Collection, Backbone.Collection);

        function Collection() {
          Collection.__super__.constructor.apply(this, arguments);
        }

        Collection.prototype.model = Model;

        return Collection;

      })();
      return public = {
        collection: new Collection
      };
    })();
    Router = (function() {

      __extends(Router, Backbone.Router);

      function Router() {
        Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.routes = {
        '!/projects/:id/*path': 'project',
        '!/projects/:id': 'project',
        '!/projects': 'project'
      };

      Router.prototype.initialize = function(api) {
        this.api = api;
        return this.navigate('!/projects');
      };

      Router.prototype.project = function(id, path) {
        console.log("id " + id);
        console.log("path " + path);
        return console.log(project.get);
      };

      return Router;

    })();
    return $(function() {
      var container, router;
      container = new Container;
      router = new Router('106.187.39.21:8000');
      return Backbone.history.start();
    });
  });

}).call(this);
