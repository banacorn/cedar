// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/account', 'jquery', 'backbone', 'template'], function(ModelAccount, $, Backbone, $$) {
    var Account, Box;
    Box = (function(_super) {

      __extends(Box, _super);

      function Box() {
        return Box.__super__.constructor.apply(this, arguments);
      }

      Box.prototype.events = {
        'click': 'resume',
        'click #signin-box': 'click',
        'submit form': 'submit',
        'click button': 'submit'
      };

      Box.prototype.initialize = function() {
        return this.template = $$.signinbox;
      };

      Box.prototype.render = function() {
        this.$el.html(this.template.render());
        return this;
      };

      Box.prototype.submit = function() {
        return this.model.signin($('#signin-username').val(), $('#signin-password').val());
      };

      Box.prototype.resume = function() {
        return this.remove();
      };

      Box.prototype.click = function() {
        return false;
      };

      Box.prototype.render = function() {
        this.$el.html(this.template.render()).hide().fadeIn(200);
        $('input', this.$el)[0].focus();
        return this;
      };

      return Box;

    })(Backbone.View);
    Account = (function(_super) {

      __extends(Account, _super);

      function Account() {
        return Account.__super__.constructor.apply(this, arguments);
      }

      Account.prototype.initialize = function() {
        var _this = this;
        window.account = this.account = new ModelAccount;
        this.account.authorize();
        this.account.on('change', function() {
          return _this.render();
        });
        this.template = $$.account;
        this.box = new Box({
          model: this.account
        });
        return this.account.on('change:success', function(model, success) {
          if (success) {
            return _this.box.resume();
          }
        });
      };

      Account.prototype.render = function() {
        this.$el.html(this.template.render({
          authorized: this.account.get('authorized'),
          username: this.account.get('username')
        }));
        return this;
      };

      Account.prototype.events = {
        'click #account-panel': 'signin',
        'click #account-signout': 'signout',
        'mouseover': 'mouseover',
        'mouseout': 'mouseout'
      };

      Account.prototype.mouseover = function() {
        return this.$el.addClass('active');
      };

      Account.prototype.mouseout = function() {
        return this.$el.removeClass('active');
      };

      Account.prototype.signin = function() {
        if (!this.account.get('authorized')) {
          $('#main').append('<div id="slot"></div>');
          return this.assign(this.box, '#slot');
        }
      };

      Account.prototype.signout = function() {
        if (this.account.get('authorized')) {
          this.account.signout();
          return this.mouseout();
        }
      };

      return Account;

    })(Backbone.View);
    return Account;
  });

}).call(this);
