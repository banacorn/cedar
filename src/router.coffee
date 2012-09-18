define [
    'underscore'
    'backbone'
    'views/projectlist'
    'views/project'
], (_, Backbone, ProjectList, Project) ->

    new class Router extends Backbone.Router
        
        routes:
            ''                              : 'home'
            'project'                       : 'project'
            'project/:name/file'            : 'project:file'
            'project/:name/file/*path'      : 'project:file'
            '*all'                          : 'otherwise'

        'project': ->
            console.log 'project page!!'
            projectList = new ProjectList
            projectList.render()



        'project:file': (name, path) ->
            project = new Project
            if path?
                path = path.replace(/\/$/, '')
            else
                path = ''
            project.render name, path
