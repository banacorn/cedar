// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  require.config({
    paths: {
      jquery: 'jam/jquery/jquery',
      underscore: 'jam/underscore/underscore',
      backbone: 'jam/backbone/backbone',
      hogan: 'jam/hogan/hogan',
      router: 'router',
      template: 'template'
    }
  });

  require(['models/settings', 'models/stat', 'router', 'skull', 'views/account', 'views/home', 'jquery', 'backbone'], function(ModelSettings, ModelStat, Router, Skull, ViewAccount, ViewHome, $, Backbone) {
    Skull;

    var App;
    App = (function(_super) {

      __extends(App, _super);

      function App() {
        return App.__super__.constructor.apply(this, arguments);
      }

      App.prototype.el = 'body';

      App.prototype.render = function() {
        var account;
        account = new ViewAccount;
        this.assign(account, '#account');
        return $('#account').hide().fadeIn(200);
      };

      return App;

    })(Backbone.View);
    Backbone.settings = new ModelSettings;
    return $(function() {
      var app, stat;
      stat = new ModelStat;
      app = new App;
      app.render();
      Router.on('route:home', function() {
        var home;
        home = new ViewHome;
        return home.render();
      });
      $('form').live('submit', function() {
        return false;
      });
      $('a').live('click', function(e) {
        var urn;
        urn = $(this).attr('href');
        Router.navigate(urn, true);
        return false;
      });
      return Backbone.history.start({
        pushState: true
      });
    });
  });

}).call(this);
