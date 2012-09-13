// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone'], function(_, Backbone) {
    var Collection, Model;
    Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        return Model.__super__.constructor.apply(this, arguments);
      }

      Model.prototype.initialize = function() {
        var path;
        if (this.get('filetype') === 0) {
          this.set('folder', true);
        } else {
          this.set('folder', false);
        }
        path = this.get('filepath') + '/' + this.get('name');
        path = _.tail(path.split('/')).join('/');
        return this.set('path', path);
      };

      return Model;

    })(Backbone.Model);
    return Collection = (function(_super) {

      __extends(Collection, _super);

      function Collection() {
        return Collection.__super__.constructor.apply(this, arguments);
      }

      Collection.prototype.model = Model;

      Collection.prototype.url = function() {
        return "/api/projects/" + this.id + "/files";
      };

      Collection.prototype.parse = function(data) {
        var fold, models;
        if (data == null) {
          data = [];
        }
        models = [];
        fold = function(tree, level) {
          var node, _i, _len, _results;
          _results = [];
          for (_i = 0, _len = tree.length; _i < _len; _i++) {
            node = tree[_i];
            node.level = level;
            if (node.children.length !== 0) {
              fold(node.children, level + 1);
            }
            delete node.children;
            _results.push(models.push(node));
          }
          return _results;
        };
        fold(data, 0);
        return models;
      };

      Collection.prototype.children = function() {
        var level;
        level = _.compact(this.path.replace(/\/$/, '').split('/')).length;
        return this.where({
          level: level
        }).map(function(model) {
          return model.toJSON();
        });
      };

      Collection.prototype.node = function() {
        var _ref;
        return (_ref = this.where({
          path: this.path
        })[0]) != null ? _ref.toJSON() : void 0;
      };

      Collection.prototype.root = function() {
        if (this.path !== '') {
          return this.path + '/';
        } else {
          return '';
        }
      };

      return Collection;

    })(Backbone.Collection);
  });

}).call(this);
