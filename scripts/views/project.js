(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'hogan', 'text!../../templates/project.html'], function($, _, Backbone, hogan, template) {
    var Collection, Model, Project;
    Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        Model.__super__.constructor.apply(this, arguments);
      }

      return Model;

    })(Backbone.Model);
    Collection = (function(_super) {

      __extends(Collection, _super);

      function Collection() {
        Collection.__super__.constructor.apply(this, arguments);
      }

      Collection.prototype.model = Model;

      Collection.prototype.url = '/projects';

      Collection.prototype.parse = function(modles) {
        this.add(modles);
        return this.trigger('ready');
      };

      return Collection;

    })(Backbone.Collection);
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.initialize = function() {
        this.template = hogan.compile(template);
        return this.collection = new Collection;
      };

      Project.prototype.render = function() {
        var _this = this;
        this.collection.fetch();
        return this.collection.on('ready', function() {
          console.log(_this.collection.toJSON());
          return $('#main').html(_this.template.render({
            projects: _this.collection.toJSON()
          }));
        });
      };

      return Project;

    })(Backbone.View);
  });

}).call(this);
