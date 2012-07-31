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
    'storage'
    'router'
    'views/home'
    'views/project'
    'views/breadcrumb'
], ($, _, Backbone, storage, router, Home, Project, Breadcrumb) ->

    Backbone.remoteSync = Backbone.sync
    
    Backbone.Collection::hol = (callback) ->
    
        cb = =>
            callback()
            @off 'reset', cb
    
        @on 'reset', cb
            
        @fetch()
    
    Backbone.sync = ->
        Backbone.remoteSync.apply @, arguments
        storage.apply @, arguments


    $.fn.render = (html, duration) ->
        #@each -> $(@).hide().html(html).fadeIn(duration || 200)
        @each -> $(@).html(html)
        
    class App extends Backbone.View
    
    
    
    $ ->
              
                    
        new App        
        new Breadcrumb                
        
        router.on 'route:project', (name) ->
        
            project = new Project name
            project.render()
            
        router.on 'route:home', ->
        
            
            home = new Home
            home.render()
            
        
        $('a').live 'click', (e) ->
            router.navigate $(@).attr('href'), true
            return false
            
            
        Backbone.history.start
            pushState: true
