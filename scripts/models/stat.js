// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['collections/entry', 'collections/locale', 'collections/localetree', 'collections/project', 'jquery', 'underscore', 'backbone'], function(CollectionEntry, CollectionLocale, CollectionLocaletree, CollectionProject, $, _, Backbone) {
    var Model;
    return Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        return Model.__super__.constructor.apply(this, arguments);
      }

      Model.prototype.defaults = {
        'project-size': void 0
      };

      Model.prototype.initialize = function() {
        this.cellar();
        return this.getAllProjects();
      };

      Model.prototype.cellar = function() {
        var data, key, value,
          _this = this;
        for (key in localStorage) {
          value = localStorage[key];
          if (/^local\/stat\/.*/.test(key)) {
            key = key.substr(11);
            data = JSON.parse(value);
            this.set(key, data);
          }
        }
        return this.on('change', function() {
          var prefix, _ref, _results;
          prefix = 'local/stat/';
          _ref = _this.attributes;
          _results = [];
          for (key in _ref) {
            value = _ref[key];
            _results.push(localStorage[prefix + key] = JSON.stringify(value));
          }
          return _results;
        });
      };

      Model.prototype.getAllProjects = function() {
        var allProjects, countEntries, fold, insertPoFileID, numberOfFileFunc, snatchEntries,
          _this = this;
        this.entriesLeft = {};
        this.entriesLeftCB = {};
        fold = function(tree, func, id) {
          var poop;
          if (tree != null) {
            poop = tree.children.map(function(child) {
              return fold(child, func, id);
            }).reduce((function(a, b) {
              return a + b;
            }), 0);
            return func(tree, poop, id) + poop;
          } else {
            return 0;
          }
        };
        numberOfFileFunc = function(tree, poop) {
          var a;
          a = 0;
          tree.numberOfFiles = poop;
          if (tree.filetype === 1) {
            a = 1;
          }
          return a;
        };
        insertPoFileID = function(tree, poop, table) {
          var _ref;
          if (tree.filetype === 1) {
            return tree.po_file_id = (_ref = _.find(table, function(a) {
              return a.project_file_id === tree.id;
            })) != null ? _ref.id : void 0;
          }
        };
        snatchEntries = function(tree, poop, id) {
          var entries;
          if (tree.filetype === 1) {
            entries = new CollectionEntry;
            entries.id = tree.po_file_id;
            return entries.snatch(function() {
              tree.entries = entries.toJSON();
              tree.numberOfEntries = entries.length;
              if (id != null) {
                _this.entriesLeft[id] -= 1;
              }
              return _this.entriesLeftCB[id]();
            });
          }
        };
        countEntries = function(tree, poop) {
          var numberOfEntries;
          numberOfEntries = 0;
          if (tree.numberOfEntries != null) {
            numberOfEntries = tree.numberOfEntries;
          } else {
            tree.numberOfEntries = poop;
          }
          return numberOfEntries;
        };
        allProjects = new CollectionProject;
        return allProjects.snatch(function() {
          var allProjectSize;
          allProjectSize = allProjects.length;
          _this.set('project-size', allProjectSize);
          return allProjects.each(function(project) {
            return $.get("/api/project_files/?project_id=" + project.id, function(yggdrasil) {
              var locales, numberOfFiles;
              if (yggdrasil.length !== 0) {
                yggdrasil = yggdrasil[0];
                numberOfFiles = fold(yggdrasil, numberOfFileFunc);
                locales = new CollectionLocale;
                locales.id = project.id;
                return locales.snatch(function() {
                  var localeTree, projectLocaleID, _ref;
                  projectLocaleID = (_ref = locales.where({
                    localeID: 1
                  })) != null ? _ref[0].get('id') : void 0;
                  localeTree = new CollectionLocaletree;
                  localeTree.id = projectLocaleID;
                  return localeTree.snatch(function() {
                    fold(yggdrasil, insertPoFileID, localeTree.toJSON());
                    _this.entriesLeft[yggdrasil.id] = numberOfFiles;
                    _this.entriesLeftCB[yggdrasil.id] = function() {
                      var numberOfEntries;
                      if (_this.entriesLeft[yggdrasil.id] === 0) {
                        numberOfEntries = fold(yggdrasil, countEntries);
                        return _this.set("yggdrasil-" + project.id, yggdrasil);
                      }
                    };
                    return fold(yggdrasil, snatchEntries, yggdrasil.id);
                  });
                });
              } else {
                return _this.set("yggdrasil-" + project.id, {
                  numberOfFiles: 0,
                  numberOfEntries: 0
                });
              }
            });
          });
        });
      };

      return Model;

    })(Backbone.Model);
  });

}).call(this);
