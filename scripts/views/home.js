// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'template', 'model'], function($, _, Backbone, template, model) {
    var HomePage;
    return HomePage = (function(_super) {

      __extends(HomePage, _super);

      function HomePage() {
        return HomePage.__super__.constructor.apply(this, arguments);
      }

      HomePage.prototype.el = $('#main');

      HomePage.prototype.initialize = function() {
        this.template = template.home;
        return this.ProjectList = new model.ProjectList;
      };

      HomePage.prototype.render = function() {
        var _this = this;
        this.ProjectList.snatch(function() {
          return _this.$el.html(_this.template.render({
            projects: _this.ProjectList.toJSON()
          }));
        });
        return this;
      };

      return HomePage;

    })(Backbone.View);
  });

}).call(this);
