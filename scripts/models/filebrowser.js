// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone'], function(Backbone) {
    var Model;
    return Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        return Model.__super__.constructor.apply(this, arguments);
      }

      Model.prototype.defaults = {
        files: []
      };

      return Model;

    })(Backbone.Model);
  });

}).call(this);
