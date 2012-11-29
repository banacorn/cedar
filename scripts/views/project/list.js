// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['collections/project', 'jquery', 'backbone', 'template'], function(CollectionProject, $, Backbone, $$) {
    var ProjectList;
    return ProjectList = (function(_super) {

      __extends(ProjectList, _super);

      function ProjectList() {
        return ProjectList.__super__.constructor.apply(this, arguments);
      }

      ProjectList.prototype.el = $('#main');

      ProjectList.prototype.initialize = function() {
        this.template = $$.projectList;
        return this.projects = new CollectionProject;
      };

      ProjectList.prototype.render = function() {
        var _this = this;
        this.projects.snatch(function() {
          return _this.$el.html(_this.template.render({
            projects: _this.projects.toJSON()
          }));
        });
        return this;
      };

      return ProjectList;

    })(Backbone.View);
  });

}).call(this);
