class Container extends Backbone.View
    el: window
    
    events:
        'resize': 'resize'
        
    initialize: ->
        @resize()
        
    render: ->
        # remove all the size classes and update a new one
        $('body').removeClass('kleine grosse').addClass "#{ @size }"
        
    resize: ->
        # detect width    
        width = $(@el).width()
        
        # see if width was changed
        if width isnt @width
        
            @width = width
        
            # set size
            if width < 1400
                @size = 'kleine'
            else if width > 1400
                @size = 'grosse'
            
            # render
            @render()
            
class Breadcrumb
        
    class View extends Backbone.View
        el: '#breadcrumb ol'
            
    constructor: ->
        @view = new View
            
    setPath: ->
        
            
            
            
class Router extends Backbone.Router
    routes:
        '!/projects/:id/*path': 'project'
        '!/projects/:id': 'project'
        '!/projects': 'project'
        
    initialize: ->
    project: (id, path) ->
        console.log "id #{id}"
        console.log "path #{path}"
            
            
$ ->
    # http://106.187.39.21:8000/
    container = new Container
    router = new Router
    _.extend router,
        breadcrumb: new Breadcrumb
        
    Backbone.history.start()
    
        
