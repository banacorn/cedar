require.config
    paths:
        jquery      : 'jam/jquery/jquery'
        underscore  : 'jam/underscore/underscore'
        backbone    : 'jam/backbone/backbone'
        hogan       : 'jam/hogan/hogan'
        
        router      : 'router'
        model       : 'model'
        template    : 'template'
        
require [
    'jquery'  
    'underscore'
    'backbone'
    'hogan'
    'router'
    'views/home'
    'views/project'
    'views/breadcrumb'
], ($, _, Backbone, hogan, router, Home, Project, Breadcrumb) ->


    $.fn.render = (html, duration) ->
        @each -> $(@).hide().html(html).fadeIn(duration || 200)
        
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
                    
        new App        
        new Breadcrumb                
        
        router.on 'route:project', (name) ->
        
            project = new Project name
            project.render()
            
        router.on 'route:home', ->
        
            
            home = new Home
            home.render()
            
        
        Backbone.history.start()
