// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone', 'voir'], function(_, Backbone, view) {
    var Router;
    return new (Router = (function(_super) {

      __extends(Router, _super);

      function Router() {
        return Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.routes = {
        '': 'home',
        'project': 'project',
        'project/:name/file': 'project:file',
        'project/:name/file/*path': 'project:file',
        'api_reference': 'api',
        '*all': 'otherwise'
      };

      Router.prototype['project'] = function() {
        var projectList;
        projectList = new view.ProjectList;
        return projectList.render();
      };

      Router.prototype['project:file'] = function(name, path) {
        var project;
        project = new view.Project;
        if (path != null) {
          path = path.replace(/\/$/, '');
        } else {
          path = '';
        }
        return project.render(name, path);
      };

      Router.prototype['api'] = function() {
        var api;
        api = new view.Api;
        return api.render();
      };

      Router.prototype['otherwise'] = function(path) {
        var notFound;
        notFound = new view.NotFound;
        return notFound.render(path);
      };

      return Router;

    })(Backbone.Router));
  });

}).call(this);
