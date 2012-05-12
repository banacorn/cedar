define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    class Router extends Backbone.Router
        
        routes:
            '!/project':    'project'
                    
        project: -> @project()
        
    return Router
