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
        'views/login'
    ], ($, _, Backbone, storage, router, Home, Project, Login) ->

        Backbone.remoteSync = Backbone.sync
        

        Backbone.Collection::snatch = (callback) ->
        
            cb = =>
                callback?()
                @off 'reset', cb
        
            @on 'reset', cb
                
            @fetch()


        Backbone.View::assign = (view, selector) ->
            view.setElement($(selector)).render()
        
        Backbone.sync = ->
            Backbone.remoteSync.apply @, arguments
            storage.apply @, arguments
            
        class App extends Backbone.View
        

                
        
        
        $ ->
                  
                        
            new App        
            # new Breadcrumb                
            new Login


            router.on 'route:home', ->
            
                
                home = new Home
                home.render()
                
            
            $('a').live 'click', (e) ->
                router.navigate $(@).attr('href'), true
                return false
                
                
            Backbone.history.start
                pushState: true
