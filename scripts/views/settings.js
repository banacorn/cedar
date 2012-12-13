// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'template'], function($, Backbone, $$) {
    var Home;
    return Home = (function(_super) {

      __extends(Home, _super);

      function Home() {
        return Home.__super__.constructor.apply(this, arguments);
      }

      Home.prototype.el = $('#main');

      Home.prototype.initialize = function() {
        return this.template = $$.settings;
      };

      Home.prototype.render = function() {
        this.$el.html(this.template.render());
        return this;
      };

      return Home;

    })(Backbone.View);
  });

}).call(this);
