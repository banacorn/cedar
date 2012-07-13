define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    class Router extends Backbone.Router
        
        routes:
            '!/project':        'projectList'
            '!/project/:pid':   'project'
                    
        project: (id) -> @project id
        projectList: -> @projectList()
        
    return Router
