define [
    'underscore'
    'backbone'
    'voir'
], (_, Backbone, view) ->
    new class Router extends Backbone.Router
        
        routes:
            ''                              : 'home'
            'project'                       : 'project'
            'project/:name/file'            : 'project:file'
            'project/:name/file/*path'      : 'project:file'
            'api_reference'                 : 'api'
            '*all'                          : 'otherwise'

        'project': ->
            projectList = new view.ProjectList
            projectList.render()


        'project:file': (name, path) ->
            project = new view.Project
            if path?
                path = path.replace(/\/$/, '')
            else
                path = ''
            project.render name, path


        'api': ->
            api = new view.Api
            api.render()

        'otherwise': (path) ->
            notFound = new view.NotFound
            notFound.render path
