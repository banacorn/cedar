// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/entry', 'jquery', 'backbone', 'template'], function(ModelEntry, $, Backbone, $$) {
    var EntryList, EntryView;
    EntryView = (function(_super) {

      __extends(EntryView, _super);

      function EntryView() {
        return EntryView.__super__.constructor.apply(this, arguments);
      }

      EntryView.prototype.events = {
        'click .entry-chevron': 'toggle'
      };

      EntryView.prototype.initialize = function() {
        var _this = this;
        this.template = $$.entry;
        this.status = new ModelEntry;
        return this.status.on('change:expand', function(model, expanded) {
          if (expanded) {
            return _this.$el.addClass('expand');
          } else {
            return _this.$el.removeClass('expand');
          }
        });
      };

      EntryView.prototype.toggle = function() {
        console.log(this.model.toJSON());
        return this.status.toggle();
      };

      EntryView.prototype.render = function() {
        var model, _ref, _ref1, _ref2, _ref3, _ref4;
        model = this.model.toJSON();
        return this.$el.html(this.template.render({
          translation: model.translation,
          context: model.context,
          id: model.id,
          flag: (_ref = model.flag) != null ? _ref.toString() : void 0,
          msgctxt: (_ref1 = model.msgctxt) != null ? _ref1.toString() : void 0,
          msgid: (_ref2 = model.msgid) != null ? _ref2.toString() : void 0,
          msgid_plural: (_ref3 = model.msgid_plural) != null ? _ref3.toString() : void 0,
          msgstr: (_ref4 = model.msgstr) != null ? _ref4.toString() : void 0,
          created_at: model.created_at,
          updated_at: model.updated_at,
          extracted_comments: model.extracted_comments
        }));
      };

      return EntryView;

    })(Backbone.View);
    return EntryList = (function(_super) {

      __extends(EntryList, _super);

      function EntryList() {
        return EntryList.__super__.constructor.apply(this, arguments);
      }

      EntryList.prototype.initialize = function() {
        var _this = this;
        this.collection.on('reset', function() {
          return _this.render();
        });
        return this.template = $$.entrylist;
      };

      EntryList.prototype.render = function() {
        var entries,
          _this = this;
        entries = this.collection.toJSON().map(function(entry) {
          entry.context = entry.msgid[0].slice(1, -1);
          entry.translation = entry.msgstr[0].slice(1, -1);
          return entry;
        });
        this.$el.html(this.template.render({
          entries: entries
        }));
        return entries.forEach(function(entry) {
          var model, view;
          model = new ModelEntry(entry);
          view = new EntryView({
            model: model
          });
          return _this.assign(view, "#entry-" + entry.id);
        });
      };

      return EntryList;

    })(Backbone.View);
  });

}).call(this);
