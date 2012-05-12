require.config
    paths:
        jquery: 'lib/jquery-1.7.1.min'
        underscore: 'lib/underscore-min.amd'
        backbone: 'lib/backbone-min.amd'
        hogan: 'lib/hogan-1.0.5.min.amd'
        
require [
    'jquery'  
    'underscore'
    'backbone'
    'hogan'
    'router'
    'views/project'
], ($, _, Backbone, hogan, Router, Project) ->
    
    
    ###
        
        
        
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
            
    ###  
        
    
        
        
    
    class App extends Backbone.View
    
        el: $ window
        
        
        events:
            'scroll': 'scroll'
    
        initialize: ->
        
    
        scroll: ->
            scrollTop =  @$el.scrollTop()
            if scrollTop > 60
                $('#breadcrumb-container').addClass 'fixed'
            else
                $('#breadcrumb-container').removeClass 'fixed'
                
    
    
    $ ->
        
        PAGE = {}
        PAGE.project = new Project
        
        APP = new App
        ROUTER = new Router
        
        
        ROUTER.project = ->
            PAGE.project.load()
        
        
        Backbone.history.start()
        ROUTER.navigate 'project'
