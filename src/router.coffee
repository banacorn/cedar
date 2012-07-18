define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    new class Router extends Backbone.Router
        
        routes:
            ''              : 'home'
            'project/:name' : 'project'
            '*all'          : 'anything'
