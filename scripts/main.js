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

  require(['router', 'storage', 'views/account', 'views/home', 'jquery', 'underscore', 'backbone'], function(Router, Storage, ViewAccount, ViewHome, $, _, Backbone) {
    var App;
    Backbone.remoteSync = Backbone.sync;
    Backbone.sync = function() {
      Backbone.remoteSync.apply(this, arguments);
      return Storage.apply(this, arguments);
    };
    Backbone.Collection.prototype.snatch = function(callback) {
      var cb,
        _this = this;
      cb = function() {
        if (typeof callback === "function") {
          callback();
        }
        return _this.off('reset', cb);
      };
      this.on('reset', cb);
      return this.fetch({
        silent: true,
        success: function(collection, res) {
          var cache, url;
          url = (typeof collection.url === "function" ? collection.url() : void 0) || collection.url;
          cache = localStorage[url];
          if (!(cache != null) || !_.isEqual(collection.toJSON(), JSON.parse(cache))) {
            return collection.trigger('reset');
          }
        }
      });
    };
    Backbone.View.prototype.assign = function(view, selector) {
      return view.setElement($(selector)).render();
    };
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
        return $('#account').hide().fadeIn();
      };

      return App;

    })(Backbone.View);
    return $(function() {
      var app;
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
        Router.navigate($(this).attr('href'), true);
        return false;
      });
      return Backbone.history.start({
        pushState: true
      });
    });
  });

}).call(this);
