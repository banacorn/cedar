// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone', 'views/project'], function(_, Backbone, Project) {
    var Router;
    return new (Router = (function(_super) {

      __extends(Router, _super);

      function Router() {
        return Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.routes = {
        '': 'home',
        'project/:name/file': 'project:file',
        'project/:name/file/*path': 'project:file',
        '*all': 'otherwise'
      };

      Router.prototype['project:file'] = function(name, path) {
        var project;
        project = new Project;
        return project.render(name, path);
      };

      return Router;

    })(Backbone.Router));
  });

}).call(this);
