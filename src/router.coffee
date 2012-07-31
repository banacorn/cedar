define [
    'underscore'
    'backbone'
    'views/project'
    'views/file'
], (_, Backbone, Project, File) ->

    new class Router extends Backbone.Router
        
        routes:
            ''                      : 'home'
            'project/:name'         : 'project:home'
            'project/:name/entry'   : 'project:entry'
            'project/:name/entry/*path'   : 'project:entry:path'
            'project/:name/user'    : 'project:user'
            '*all'                  : 'otherwise'


        'project:home': (name) ->
            console.log 'foo'

            project = new Project
            project.render name

        'project:entry': (name) ->
            console.log name

            file = new File
            file.render name