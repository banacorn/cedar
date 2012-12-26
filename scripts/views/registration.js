// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/registration', 'jquery', 'backbone', 'template'], function(ModelRegistration, $, Backbone, $$) {
    var View;
    return View = (function(_super) {

      __extends(View, _super);

      function View() {
        return View.__super__.constructor.apply(this, arguments);
      }

      View.prototype.el = $('#main');

      View.prototype.events = {
        'submit #form': 'submit'
      };

      View.prototype.initialize = function() {
        return this.template = $$.registration;
      };

      View.prototype.render = function() {
        this.$el.html(this.template.render());
        $('#username').val('banana');
        $('#email').val('baba@asdf.com');
        $('#password').val('aaaaaa');
        $('#password-confirmation').val('aaaaaa');
        return this;
      };

      View.prototype.submit = function() {
        var _this = this;
        this.resetError();
        this.model = new ModelRegistration({
          username: $('#username').val(),
          email: $('#email').val(),
          password: $('#password').val(),
          passwordConfirmation: $('#password-confirmation').val()
        });
        this.model.on('error', function(model, error) {
          switch (error) {
            case 'password confirmation mismatched':
              return _this.errorPasswordMismatched();
            case 'password too short':
              return _this.errorPasswordTooShort();
            case 'username too short':
              return _this.errorUsernameTooShort();
            case 'username too long':
              return _this.errorUsernameTooLong();
            case 'username taken':
              return _this.errorUsernameTaken();
            case 'email taken':
              return _this.errorEmailTaken();
          }
        });
        this.model.on('success', function() {
          return console.log('success');
        });
        return this.model.save();
      };

      View.prototype.pending = function() {
        return $('#submit').text('...');
      };

      View.prototype.resetError = function() {
        return $('#form input').removeClass('invalid').next().empty();
      };

      View.prototype.errorPasswordMismatched = function() {
        $('#password').addClass('invalid');
        return $('#password-confirmation').addClass('invalid').next().text('與前組密碼不同');
      };

      View.prototype.errorPasswordTooShort = function() {
        return $('#password').addClass('invalid').next().text('密碼需長於六個字');
      };

      View.prototype.errorUsernameTooShort = function() {
        return $('#username').addClass('invalid').next().text('帳號需長於三個字');
      };

      View.prototype.errorUsernameTooLong = function() {
        return $('#username').addClass('invalid').next().text('帳號需短於二十個字');
      };

      View.prototype.errorUsernameTaken = function() {
        return $('#username').addClass('invalid').next().text('帳號名稱已被使用');
      };

      View.prototype.errorEmailTaken = function() {
        return $('#email').addClass('invalid').next().text('信箱已被使用');
      };

      return View;

    })(Backbone.View);
  });

}).call(this);
