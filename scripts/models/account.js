// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['underscore', 'backbone'], function(_, Backbone) {
    var Model;
    return Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        return Model.__super__.constructor.apply(this, arguments);
      }

      Model.prototype.url = 'http://itswindtw.info:9001/api/users/sign_in';

      Model.prototype.defaults = {
        'authorized': false,
        'username': void 0,
        'password': void 0
      };

      Model.prototype.parse = function(data) {
        if (data != null) {
          this.set('authorized', true);
          Backbone.authorized = true;
          Backbone.trigger('authorized');
          if (data.user != null) {
            _.extend(data, data.user);
            delete data.user;
          }
        }
        return data;
      };

      Model.prototype.authorize = function() {
        var _this = this;
        return this.fetch({
          xhrFields: {
            withCredentials: true
          },
          error: function() {
            return _this.set('authorized', false);
          }
        });
      };

      Model.prototype.signin = function(username, password) {
        var _this = this;
        return this.fetch({
          data: JSON.stringify({
            user: {
              login: username,
              password: password,
              remember_me: 0
            }
          }),
          type: 'POST',
          xhrFields: {
            withCredentials: true
          },
          contentType: 'application/json; charset=utf-8',
          success: function() {
            return _this.set('authorized', true);
          }
        });
      };

      Model.prototype.signout = function() {
        var _this = this;
        return this.fetch({
          url: 'http://itswindtw.info:9001/api/users/sign_out',
          type: 'DELETE',
          xhrFields: {
            withCredentials: true
          },
          success: function() {
            return _this.set('authorized', false);
          },
          error: function() {
            return _this.set('authorized', false);
          }
        });
      };

      return Model;

    })(Backbone.Model);
  });

}).call(this);
