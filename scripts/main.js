// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  require.config({
    paths: {
      jquery: 'jam/jquery/jquery',
      underscore: 'jam/underscore/underscore',
      backbone: 'jam/backbone/backbone',
      hogan: 'jam/hogan/hogan',
      router: 'router',
      template: 'template'
    }
  });

  require(['router', 'jquery', 'backbone'], function(Router, $, Backbone) {
    var App, app;
    App = (function(_super) {

      __extends(App, _super);

      function App() {
        return App.__super__.constructor.apply(this, arguments);
      }

      App.prototype.enablePushState = function() {
        return Backbone.history.start({
          pushState: true
        });
      };

      App.prototype.disableAnchor = function() {
        return $('a').live('click', function() {
          var urn;
          urn = $(this).attr('href');
          Router.navigate(urn, true);
          return false;
        });
      };

      return App;

    })(Backbone.View);
    app = new App;
    return $(function() {
      app.enablePushState();
      app.disableAnchor();
      return $(window).scroll(function() {
        var barTop, fixed, scrollPos;
        fixed = $('#bar').hasClass('fixed');
        barTop = $('#bar-container').position().top;
        scrollPos = $(window).scrollTop();
        if (scrollPos > barTop && !fixed) {
          console.log('fix');
          $('#bar').addClass('fixed');
        }
        if (scrollPos <= barTop && fixed) {
          console.log('norm');
          return $('#bar').removeClass('fixed');
        }
      });
    });
  });

}).call(this);
