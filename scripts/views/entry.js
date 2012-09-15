// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'template', 'model'], function($, _, Backbone, template, model) {
    var View;
    return View = (function(_super) {

      __extends(View, _super);

      function View() {
        return View.__super__.constructor.apply(this, arguments);
      }

      View.prototype.initialize = function() {
        var _this = this;
        this.collection.on('reset', function() {
          return _this.render();
        });
        return this.template = template.entries;
      };

      View.prototype.render = function() {
        var entries;
        entries = this.collection.toJSON().map(function(entry) {
          entry.context = entry.msgid[0].slice(1, -1);
          entry.translation = entry.msgstr[0].slice(1, -1);
          return entry;
        });
        return this.$el.html(this.template.render({
          entries: entries
        }));
      };

      return View;

    })(Backbone.View);
  });

}).call(this);
