define [
    'views/api',
    'views/notfound',
    'views/project/list',
    'views/project',
    'views/registration',
    'views/settings',
    'jquery',
    'backbone'
], (ViewApi, ViewNotfound, ViewProjectList, ViewProject, ViewRegistration, ViewSettings, $, Backbone) ->
    new class Router extends Backbone.Router
        
        routes:
            ''                              : 'home'
            'registration'                  : 'registration'
            'settings'                      : 'settings'
            'project'                       : 'project'
            'project/:name/file'            : 'project:file'
            'project/:name/file/*path'      : 'project:file'
            'api_reference'                 : 'api'
            '*all'                          : 'otherwise'

        'registration': ->
            registrationPage = new ViewRegistration
            registrationPage.render()

        'settings': ->
            settingsPage = new ViewSettings
            settingsPage.render()

        'project': ->
            projectList = new ViewProjectList
            projectList.render()


        'project:file': (name, path) ->
            project = new ViewProject
            if path?
                path = path.replace(/\/$/, '')
            else
                path = ''
            project.render name, path


        'api': ->
            api = new ViewApi
            api.render()

        'otherwise': (path) ->
            notFound = new ViewNotfound
            notFound.render path
