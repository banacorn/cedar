// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'template'], function($, _, Backbone, $$) {
    var ProjectBreadcrumb;
    return ProjectBreadcrumb = (function(_super) {

      __extends(ProjectBreadcrumb, _super);

      function ProjectBreadcrumb() {
        return ProjectBreadcrumb.__super__.constructor.apply(this, arguments);
      }

      ProjectBreadcrumb.prototype.events = {
        'click #button-list-ordering': 'eventListOrdering',
        'click #button-icon-ordering': 'eventIconOrdering'
      };

      ProjectBreadcrumb.prototype.tagName = 'ol';

      ProjectBreadcrumb.prototype.initialize = function() {
        var _this = this;
        this.model.on('change', function() {
          return _this.render();
        });
        return this.listenTo(Backbone.settings, 'change:fileOrdering', this.updateFileOrdering);
      };

      ProjectBreadcrumb.prototype.render = function() {
        this.template = $$.projectBreadcrumb;
        this.$el.html(this.template.render({
          projectName: this.model.get('projectName'),
          crumbs: this.model.get('crumbs'),
          listOrdering: (Backbone.settings.get('fileOrdering')) === 'list'
        }));
        return this;
      };

      ProjectBreadcrumb.prototype.eventListOrdering = function() {
        return Backbone.settings.set('fileOrdering', 'list');
      };

      ProjectBreadcrumb.prototype.eventIconOrdering = function() {
        return Backbone.settings.set('fileOrdering', 'icon');
      };

      ProjectBreadcrumb.prototype.updateFileOrdering = function(_, setting) {
        switch (setting) {
          case 'icon':
            $('#button-icon-ordering').addClass('active');
            return $('#button-list-ordering').removeClass('active');
          case 'list':
            $('#button-list-ordering').addClass('active');
            return $('#button-icon-ordering').removeClass('active');
        }
      };

      return ProjectBreadcrumb;

    })(Backbone.View);
  });

}).call(this);
