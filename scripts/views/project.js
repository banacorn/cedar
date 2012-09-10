// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'hogan', 'template', 'model'], function($, _, Backbone, hogan, template, MODEL) {
    var Project;
    return Project = (function(_super) {

      __extends(Project, _super);

      function Project() {
        return Project.__super__.constructor.apply(this, arguments);
      }

      Project.prototype.el = $('#main');

      Project.prototype.initialize = function() {
        this.template = template.project;
        this.projectList = new MODEL.Projects;
        return this.fileTree = new MODEL.FileTree;
      };

      Project.prototype.render = function(name, path) {
        var _this = this;
        this.projectList.snatch(function() {
          var project;
          project = _this.projectList.where({
            name: name
          })[0];
          _this.fileTree.id = project.id;
          return _this.fileTree.snatch(function() {
            var fileTree, level, match, pathseg, root, roots, _i, _len;
            if (path == null) {
              path = '';
            }
            path = path.replace(/\/$/, '');
            if (path && path.length !== 0) {
              path += '/';
            } else {
              path = '';
            }
            match = path.match(/\//ig);
            if (match == null) {
              match = [];
            }
            level = match.length;
            fileTree = _this.fileTree.where({
              level: level
            }).map(function(model) {
              return model.toJSON();
            });
            root = _.compact(path.split('/'));
            roots = [''];
            for (_i = 0, _len = root.length; _i < _len; _i++) {
              pathseg = root[_i];
              roots.push(_.last(roots) + pathseg + '/');
            }
            roots = _.tail(roots);
            roots = _(roots).map(function(e, i) {
              return {
                segment: e,
                pathname: root[i]
              };
            });
            return _this.$el.html(_this.template.render({
              projectName: project.get('name'),
              projectInfo: project.get('info'),
              id: project.id,
              files: fileTree,
              roots: roots
            }));
          });
        });
        return this;
      };

      return Project;

    })(Backbone.View);
  });

}).call(this);
