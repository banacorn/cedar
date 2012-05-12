(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'hogan', 'text!../../templates/project.html'], function($, _, Backbone, hogan, template) {
    var Project;
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.load = function() {
        return $('#main').html(template);
      };

      return Project;

    })(Backbone.View);
  });

}).call(this);
