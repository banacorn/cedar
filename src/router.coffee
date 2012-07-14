define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    new class Router extends Backbone.Router
        
        routes:
            ''              : 'home'
            'project'       : 'projectList'
            'project/:id'   : 'project'
            '*all'          : 'anything'
