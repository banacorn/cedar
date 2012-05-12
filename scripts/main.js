(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  require.config({
    paths: {
      jquery: 'lib/jquery-1.7.1.min',
      io: 'lib/socket.io.min.amd',
      raphael: 'lib/raphael-min',
      underscore: 'lib/underscore-min.amd',
      backbone: 'lib/backbone-min.amd',
      hogan: 'lib/hogan-1.0.5.min.amd'
    }
  });

  require(['jquery', 'io', 'underscore', 'backbone', 'hogan'], function($, io, _, Backbone, hogan) {
    var App, Project, ProjectCollection, ProjectPage, ProjectView, Router;
    Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        Project.__super__.constructor.apply(this, arguments);
      }

      return Project;

    })(Backbone.Model);
    ProjectCollection = (function(_super) {

      __extends(ProjectCollection, _super);

      function ProjectCollection() {
        ProjectCollection.__super__.constructor.apply(this, arguments);
      }

      ProjectCollection.prototype.url = 'projects';

      ProjectCollection.prototype.parse = function(data) {
        var model, _i, _len;
        for (_i = 0, _len = data.length; _i < _len; _i++) {
          model = data[_i];
          this.add(model);
        }
        return console.log(this.models);
      };

      return ProjectCollection;

    })(Backbone.Collection);
    ProjectView = (function(_super) {

      __extends(ProjectView, _super);

      function ProjectView() {
        ProjectView.__super__.constructor.apply(this, arguments);
      }

      ProjectView.prototype.render = function() {
        return console.log('render project');
      };

      return ProjectView;

    })(Backbone.View);
    ProjectPage = (function(_super) {

      __extends(ProjectPage, _super);

      function ProjectPage() {
        ProjectPage.__super__.constructor.apply(this, arguments);
      }

      ProjectPage.prototype.tagName = 'section';

      ProjectPage.prototype.id = 'project';

      ProjectPage.prototype.initialize = function() {
        return this.collection = new ProjectCollection;
      };

      ProjectPage.prototype.render = function() {
        return this.collection.fetch();
      };

      ProjectPage.prototype.load = function() {
        return $('#main').html;
      };

      return ProjectPage;

    })(Backbone.View);
    Router = (function(_super) {

      __extends(Router, _super);

      function Router() {
        Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.routes = {
        '!/project': 'project'
      };

      Router.prototype.project = function() {
        return this.project();
      };

      return Router;

    })(Backbone.Router);
    App = (function(_super) {

      __extends(App, _super);

      function App() {
        App.__super__.constructor.apply(this, arguments);
      }

      App.prototype.el = $(window);

      App.prototype.events = {
        'scroll': 'scroll'
      };

      App.prototype.initialize = function() {
        return this.project = new ProjectPage;
      };

      App.prototype.scroll = function() {
        var scrollTop;
        scrollTop = this.$el.scrollTop();
        if (scrollTop > 60) {
          return $('#breadcrumb-container').addClass('fixed');
        } else {
          return $('#breadcrumb-container').removeClass('fixed');
        }
      };

      App.prototype.loadProject = function() {
        return this.project.render();
      };

      return App;

    })(Backbone.View);
    return $(function() {
      var APP, PAGE, ROUTER;
      PAGE = {};
      PAGE.project = new ProjectPage;
      APP = new App;
      ROUTER = new Router;
      ROUTER.project = function() {
        return PAGE.project.load();
      };
      Backbone.history.start();
      return ROUTER.navigate('!/project');
    });
  });

}).call(this);
