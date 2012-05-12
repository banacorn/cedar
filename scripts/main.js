(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  require.config({
    paths: {
      jquery: 'lib/jquery-1.7.1.min',
      underscore: 'lib/underscore-min.amd',
      backbone: 'lib/backbone-min.amd',
      hogan: 'lib/hogan-1.0.5.min.amd'
    }
  });

  require(['jquery', 'underscore', 'backbone', 'hogan', 'router', 'views/project'], function($, _, Backbone, hogan, Router, Project) {
    /*
            
            
            
        class Project extends Backbone.Model
            
        class ProjectCollection extends Backbone.Collection    
            url: 'projects'
            
            parse: (data) ->
                
                for model in data
                    @add model
            
            
            
                console.log @models
        
        class ProjectView extends Backbone.View
        
        
            render: ->
                console.log 'render project'
        
        
        class ProjectPage extends Backbone.View
            
            tagName : 'section'
            id      : 'project'
            template: hogan
        
            initialize: ->
                @collection = new ProjectCollection
        
            render: ->
                @collection.fetch()
                
            load: ->
                $('#main').html
    */
    var App;
    App = (function(_super) {

      __extends(App, _super);

      function App() {
        App.__super__.constructor.apply(this, arguments);
      }

      App.prototype.el = $(window);

      App.prototype.events = {
        'scroll': 'scroll'
      };

      App.prototype.initialize = function() {};

      App.prototype.scroll = function() {
        var scrollTop;
        scrollTop = this.$el.scrollTop();
        if (scrollTop > 60) {
          return $('#breadcrumb-container').addClass('fixed');
        } else {
          return $('#breadcrumb-container').removeClass('fixed');
        }
      };

      return App;

    })(Backbone.View);
    return $(function() {
      var APP, PAGE, ROUTER;
      PAGE = {};
      PAGE.project = new Project;
      APP = new App;
      ROUTER = new Router;
      ROUTER.project = function() {
        return PAGE.project.load();
      };
      Backbone.history.start();
      return ROUTER.navigate('project');
    });
  });

}).call(this);
