// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'template', 'backbone.marionette'], function($, Backbone, $$) {
    var Layout, layout;
    Backbone.remoteSync = Backbone.sync;
    Backbone.sync = function(method, model, option) {
      var data, url;
      if (typeof model.url === 'function') {
        url = model.url();
      } else {
        url = model.url;
      }
      switch (method) {
        case 'read':
          model.on('reset', function() {
            return localStorage[url] = JSON.stringify(model.toJSON());
          });
          if ((typeof localStorage !== "undefined" && localStorage !== null ? localStorage[url] : void 0) != null) {
            data = JSON.parse(localStorage[url]);
            if (model instanceof Backbone.Collection) {
              model.reset(data);
            }
            if (model instanceof Backbone.Model) {
              model.set(data);
            }
          }
          break;
        case 'create':
          if (typeof localStorage !== "undefined" && localStorage !== null) {
            localStorage[url] = JSON.stringify(model.toJSON());
          }
          break;
        case 'update':
          if (typeof localStorage !== "undefined" && localStorage !== null) {
            localStorage[url] = JSON.stringify(model.toJSON());
          }
      }
      return Backbone.remoteSync.apply(this, arguments);
    };
    Backbone.Marionette.Renderer.render = function(template, data) {
      return template.render(data);
    };
    Layout = (function(_super) {

      __extends(Layout, _super);

      function Layout() {
        return Layout.__super__.constructor.apply(this, arguments);
      }

      Layout.prototype.template = $$.layout;

      Layout.prototype.regions = {
        main: '#main'
      };

      return Layout;

    })(Backbone.Marionette.Layout);
    layout = new Layout;
    return layout;
  });

}).call(this);
