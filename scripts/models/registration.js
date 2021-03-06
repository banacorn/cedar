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

      Model.prototype.url = '/api/users';

      Model.prototype.initialize = function() {
        var _this = this;
        return this.on('error', function(model, error) {
          var errorMessage;
          if (error.status === 403) {
            errorMessage = (JSON.parse(error.responseText)).errors;
            if (_.contains(errorMessage, 'Username has already been taken')) {
              _this.trigger('error', _this, 'username taken');
            }
            if (_.contains(errorMessage, 'Email has already been taken')) {
              _this.trigger('error', _this, 'email taken');
            }
            if (_.contains(errorMessage, 'Username is too long (maximum is 20 characters)')) {
              return _this.trigger('error', _this, 'username too lone');
            }
          }
        });
      };

      Model.prototype.defaults = {
        username: void 0,
        email: void 0,
        password: void 0,
        passwordConfirmation: 'fuck you'
      };

      Model.prototype.validate = function(user) {
        if (user.username.length < 3) {
          return "username too short";
        }
        if (user.username.length > 20) {
          return "username too long";
        }
        if (user.password !== user.passwordConfirmation) {
          return "password confirmation mismatched";
        }
        if (user.password.length < 6) {
          return "password too short";
        }
      };

      Model.prototype.parse = function(result) {
        return this.trigger('success', this);
      };

      return Model;

    })(Backbone.Model);
  });

}).call(this);
