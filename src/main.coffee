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
    
    
    class App extends Backbone.View
    
        el: $ window
        
        
        events:
            'scroll': 'scroll'
    
        initialize: ->
        
    
        scroll: ->
            scrollTop =  @$el.scrollTop()
            if scrollTop > 60
                $('#breadcrumb-container').addClass 'fixed'
                $('#main-container').addClass 'fixed'
            else
                $('#breadcrumb-container').removeClass 'fixed'
                $('#main-container').removeClass 'fixed'
                
    
    
    $ ->
        
        PAGE = {}
        PAGE.project = new Project
        
        APP = new App
        ROUTER = new Router
        
        
        ROUTER.project = ->
            console.log '!/projects'
            PAGE.project.render()
        
        Backbone.history.start()
        ROUTER.navigate '!/project'
            trigger: true
            replace: true
        
