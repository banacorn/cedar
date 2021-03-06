// Generated by CoffeeScript 1.4.0
(function() {

  define(['storage', 'jquery', 'underscore', 'backbone'], function(Storage, $, _, Backbone) {
    Backbone.remoteSync = Backbone.sync;
    Backbone.sync = function(method, model, options) {
      var local, url;
      if (typeof model.url === 'function') {
        url = model.url();
      } else {
        url = model.url;
      }
      local = /^local\/.+/.test(url);
      if (!local) {
        Backbone.remoteSync.apply(this, arguments);
      }
      return Storage.apply(this, arguments);
    };
    Backbone.Collection.prototype.snatch = function(callback) {
      if (callback != null) {
        this.once('reset', callback);
      }
      return this.fetch({
        silent: true,
        success: function(collection, response) {
          var cache, url;
          url = (typeof collection.url === "function" ? collection.url() : void 0) || collection.url;
          cache = localStorage[url];
          if (!(cache != null) || !_.isEqual(collection.toJSON(), JSON.parse(cache))) {
            return collection.trigger('reset');
          }
        }
      });
    };
    return Backbone.View.prototype.assign = function(view, selector) {
      return view.setElement($(selector)).render();
    };
  });

}).call(this);
