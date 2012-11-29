// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone'], function(Backbone) {
    var Entry;
    return Entry = (function(_super) {

      __extends(Entry, _super);

      function Entry() {
        return Entry.__super__.constructor.apply(this, arguments);
      }

      Entry.prototype.defaults = {
        expand: false
      };

      Entry.prototype.toggle = function() {
        return this.set('expand', !this.get('expand'));
      };

      return Entry;

    })(Backbone.Model);
  });

}).call(this);
