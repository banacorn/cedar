// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'hogan', 'template', 'model', 'views/locale'], function($, _, Backbone, hogan, template, model, LocaleView) {
    var Project;
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        return Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.el = $('#main');

      Project.prototype.initialize = function(name) {
        this.template = template.project;
        this.collection = new model.Projects;
        return this.name = name;
      };

      Project.prototype.render = function() {
        var localeView,
          _this = this;
        localeView = new LocaleView;
        this.collection.hol(function() {
          _this.model = _this.collection.where({
            name: _this.name
          })[0];
          return _this.$el.render(_this.template.render({
            name: _this.model.get('name'),
            info: _this.model.get('info'),
            id: _this.model.id,
            locales: localeView.render(_this.model.id, _this.model.get('name')).el
          }));
        });
        return this;
      };

      return Project;

    })(Backbone.View);
  });

}).call(this);
