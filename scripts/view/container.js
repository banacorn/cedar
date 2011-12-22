(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone'], function($, Backbone) {
    var Container;
    return Container = (function() {

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
  });

}).call(this);
