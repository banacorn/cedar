// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone', 'model'], function(_, Backbone, model) {
    var Collection;
    return Collection = (function(_super) {

      __extends(Collection, _super);

      function Collection() {
        return Collection.__super__.constructor.apply(this, arguments);
      }

      Collection.prototype.model = model.Project;

      Collection.prototype.url = '/api/projects';

      Collection.prototype.parse = function(data) {
        var fold, models;
        models = [];
        fold = function(tree) {
          var node, _i, _len, _results;
          _results = [];
          for (_i = 0, _len = tree.length; _i < _len; _i++) {
            node = tree[_i];
            if (node.children) {
              fold(node.children);
            }
            delete node.children;
            _results.push(models.push(node));
          }
          return _results;
        };
        fold(data);
        return models;
      };

      return Collection;

    })(Backbone.Collection);
  });

}).call(this);
