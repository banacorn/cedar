// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['init', 'views/home', 'views/project/list', 'views/registration', 'jquery', 'backbone'], function(Init, ViewHome, ViewProjectList, ViewRegistration, $, Backbone) {
    Init;

    var Router;
    Router = (function(_super) {

      __extends(Router, _super);

      function Router() {
        return Router.__super__.constructor.apply(this, arguments);
      }

      Router.prototype.routes = {
        '': 'home',
        'registration': 'registration',
        'project': 'projectList'
      };

      Router.prototype.initialize = function() {};

      Router.prototype.home = function() {
        var homeView;
        homeView = new ViewHome;
        return $('#main').html(homeView.el);
      };

      Router.prototype.registration = function() {
        var registrationView;
        registrationView = new ViewRegistration;
        return $('#main').html(registrationView.el);
      };

      Router.prototype.projectList = function() {
        var projectListView;
        projectListView = new ViewProjectList;
        return $('#main').html(projectListView.el);
      };

      return Router;

    })(Backbone.Router);
    return new Router;
  });

}).call(this);
