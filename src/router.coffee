define [
    'underscore'
    'backbone'
    'views/projectlist'
    'views/project'
    'views/notfound'
    'views/api'
], (_, Backbone, ProjectList, Project, NotFound, API) ->

    new class Router extends Backbone.Router
        
        routes:
            ''                              : 'home'
            'project'                       : 'project'
            'project/:name/file'            : 'project:file'
            'project/:name/file/*path'      : 'project:file'
            'api_reference'                 : 'api'
            '*all'                          : 'otherwise'

        'project': ->
            projectList = new ProjectList
            projectList.render()


        'project:file': (name, path) ->
            project = new Project
            if path?
                path = path.replace(/\/$/, '')
            else
                path = ''
            project.render name, path


        'api': ->
            api = new API
            api.render()

        'otherwise': (path) ->
            notFound = new NotFound
            notFound.render path
