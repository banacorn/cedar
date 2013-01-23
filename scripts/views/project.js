// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/file', 'jquery', 'backbone', 'template', 'backbone.marionette'], function(ViewFile, $, Backbone, $$) {
    var Project;
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        return Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.template = $$.project;

      Project.prototype.tagName = 'section';

      Project.prototype.id = 'project';

      Project.prototype.itemView = ViewFile;

      Project.prototype.itemViewContainer = 'ol';

      return Project;

    })(Backbone.Marionette.CompositeView);
  });

}).call(this);
