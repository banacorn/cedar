// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['collections/file', 'collections/project', 'layout', 'models/project', 'regions/main', 'views/home', 'views/project/list', 'views/project', 'jquery', 'backbone'], function(CollectionFile, CollectionProject, Layout, ModelProject, RegionMain, ViewHome, ViewProjectList, ViewProject, $, Backbone) {
    var Router;
    Router = (function(_super) {

      __extends(Router, _super);

      function Router() {
        return Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.initialize = function() {
        Layout.render();
        return $('body').html($(Layout.el).children());
      };

      Router.prototype.routes = {
        '': 'home',
        'project': 'projectList',
        'project/:id': 'project'
      };

      Router.prototype.home = function() {
        var homeView;
        homeView = new ViewHome;
        return RegionMain.show(homeView);
      };

      Router.prototype.projectList = function() {
        var projectList, projectListView;
        projectList = new CollectionProject;
        projectListView = new ViewProjectList({
          collection: projectList
        });
        RegionMain.show(projectListView);
        projectList.fetch();
        return projectList.on('reset', function() {
          return console.log(projectList.toJSON());
        });
      };

      Router.prototype.project = function(id) {
        var files, project, projectView;
        project = new ModelProject({
          id: id
        });
        files = new CollectionFile({
          projectID: id,
          localeID: 1
        });
        projectView = new ViewProject({
          model: project,
          collection: files
        });
        RegionMain.show(projectView);
        project.fetch();
        return files.fetch();
      };

      return Router;

    })(Backbone.Router);
    return new Router;
  });

}).call(this);
