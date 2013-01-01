// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['collections/entry', 'collections/locale', 'collections/localetree', 'models/project/browser', 'views/entry', 'jquery', 'backbone', 'template'], function(CollectionEntry, CollectionLocale, CollectionLocaletree, ModelProjectBrowser, ViewEntry, $, Backbone, $$) {
    var Browser;
    return Browser = (function(_super) {

      __extends(Browser, _super);

      function Browser() {
        return Browser.__super__.constructor.apply(this, arguments);
      }

      Browser.prototype.tagName = 'ol';

      Browser.prototype.initialize = function() {
        var _this = this;
        this.collection.on('reset', function() {
          return _this.render();
        });
        this.model = new ModelProjectBrowser;
        this.view = {
          Entries: ViewEntry
        };
        return this.listenTo(Backbone.settings, 'change:fileOrdering', this.eventFileOrdering);
      };

      Browser.prototype.eventFileOrdering = function() {
        var ordering;
        ordering = Backbone.settings.get('fileOrdering');
        switch (ordering) {
          case 'list':
            return this.$el.removeClass('icon-ordering').addClass('list-ordering');
          case 'icon':
            return this.$el.removeClass('list-ordering').addClass('icon-ordering');
        }
      };

      Browser.prototype.render = function() {
        var fileID, isFile, locales, projectID, template, _ref,
          _this = this;
        template = $$.projectBrowser;
        isFile = ((_ref = this.collection.node()) != null ? _ref.folder : void 0) === false;
        projectID = this.collection.id;
        fileID = this.collection.node();
        if (isFile) {
          locales = new CollectionLocale;
          locales.id = projectID;
          locales.snatch(function() {
            var localeTree, projectLocaleID, _ref1;
            projectLocaleID = (_ref1 = locales.where({
              localeID: 1
            })) != null ? _ref1[0].get('id') : void 0;
            localeTree = new CollectionLocaletree;
            localeTree.id = projectLocaleID;
            return localeTree.snatch(function() {
              var entries, entriesView, projectFileID, _ref2, _ref3;
              projectFileID = _this.collection.node().id;
              fileID = (_ref2 = localeTree.where({
                'project_file_id': projectFileID
              })) != null ? (_ref3 = _ref2[0]) != null ? _ref3.get('id') : void 0 : void 0;
              console.log('fileID', fileID);
              entries = new CollectionEntry;
              entries.id = fileID;
              entriesView = new ViewEntry({
                collection: entries
              });
              _this.assign(entriesView, '#project-editor');
              return entries.snatch();
            });
          });
          this.$el.html(template.render({
            isFile: isFile
          }));
        } else {
          this.$el.html(template.render({
            isFile: isFile,
            files: this.collection.children(),
            root: this.collection.root(),
            projectName: this.collection.name
          }));
          this.eventFileOrdering();
        }
        return this;
      };

      return Browser;

    })(Backbone.View);
  });

}).call(this);