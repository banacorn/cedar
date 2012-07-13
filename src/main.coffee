require.config
    paths:
        jquery: 'jam/jquery/jquery'
        underscore: 'jam/underscore/underscore'
        backbone: 'jam/backbone/backbone'
        hogan: 'jam/hogan/hogan'
        
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
                    
        ROUTER.projectList = ->
        
            console.log '!/projects'
            PAGE.project.render()
            
        ROUTER.project= (id) ->
        
            console.log id
        
        Backbone.history.start()
        ROUTER.navigate '!/project'
            trigger: true
            replace: true
        
