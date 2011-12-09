(function() {
  var Container;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Container = (function() {

    __extends(Container, Backbone.View);

    function Container() {
      Container.__super__.constructor.apply(this, arguments);
    }

    Container.prototype.el = window;

    Container.prototype.fix = 'free';

    Container.prototype.events = {
      'resize': 'resize',
      'scroll': 'scroll'
    };

    Container.prototype.initialize = function() {
      this.resize();
      return this.scroll();
    };

    Container.prototype.render = function() {
      return $('body').removeClass('kleine mittel grosse fixed free').addClass("" + this.size + " " + this.fix);
    };

    Container.prototype.resize = function() {
      var width;
      width = $(this.el).width();
      if (width !== this.width) {
        this.width = width;
        if (width < 1000) {
          this.size = 'kleine';
        } else if (width > 1000 && width < 1400) {
          this.size = 'mittel';
        } else if (width > 1400) {
          this.size = 'grosse';
        }
        return this.render();
      }
    };

    Container.prototype.scroll = function() {
      var scrollTop;
      scrollTop = $('body').scrollTop();
      if (scrollTop < 60 && this.fix === 'fixed') {
        console.log('ah');
        this.fix = 'free';
        return this.render();
      } else if (scrollTop > 60 && this.fix !== 'fixed') {
        console.log('ah');
        this.fix = 'fixed';
        return this.render();
      }
    };

    return Container;

  })();

  $(function() {
    var container;
    return container = new Container;
  });

}).call(this);
