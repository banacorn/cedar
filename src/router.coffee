define [
    'underscore'
    'backbone'
    'views/project'
], (_, Backbone, Project) ->

    new class Router extends Backbone.Router
        
        routes:
            ''                      : 'home'
            'project/:name'         : 'project:home'
            'project/:name/entry'   : 'project:entry'
            'project/:name/user'    : 'project:user'
            '*all'                  : 'otherwise'


        'project:home': (name) ->
            console.log 'foo'

            project = new Project

            project.render name
