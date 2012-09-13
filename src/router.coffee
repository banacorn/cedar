define [
    'underscore'
    'backbone'
    'views/project'
], (_, Backbone, Project) ->

    new class Router extends Backbone.Router
        
        routes:
            ''                              : 'home'
            'project/:name/file'            : 'project:file'
            'project/:name/file/*path'      : 'project:file'
            '*all'                          : 'otherwise'


        'project:file': (name, path) ->
            project = new Project
            if path?
                path = path.replace(/\/$/, '')
            else
                path = ''
            project.render name, path
