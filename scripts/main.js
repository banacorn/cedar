(function() {
  var Breadcrumb, Container, Router;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Container = (function() {

    __extends(Container, Backbone.View);

    function Container() {
      Container.__super__.constructor.apply(this, arguments);
    }

    Container.prototype.el = window;

    Container.prototype.events = {
      'resize': 'resize'
    };

    Container.prototype.initialize = function() {
      return this.resize();
    };

    Container.prototype.render = function() {
      return $('body').removeClass('kleine grosse').addClass("" + this.size);
    };

    Container.prototype.resize = function() {
      var width;
      width = $(this.el).width();
      if (width !== this.width) {
        this.width = width;
        if (width < 1400) {
          this.size = 'kleine';
        } else if (width > 1400) {
          this.size = 'grosse';
        }
        return this.render();
      }
    };

    return Container;

  })();

  Breadcrumb = (function() {
    var View;

    View = (function() {

      __extends(View, Backbone.View);

      function View() {
        View.__super__.constructor.apply(this, arguments);
      }

      View.prototype.el = '#breadcrumb ol';

      return View;

    })();

    function Breadcrumb() {
      this.view = new View;
    }

    Breadcrumb.prototype.setPath = function() {};

    return Breadcrumb;

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

    Router.prototype.initialize = function() {};

    Router.prototype.project = function(id, path) {
      console.log("id " + id);
      return console.log("path " + path);
    };

    return Router;

  })();

  $(function() {
    var container, router;
    container = new Container;
    router = new Router;
    _.extend(router, {
      breadcrumb: new Breadcrumb
    });
    return Backbone.history.start();
  });

}).call(this);
