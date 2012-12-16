define [
    'views/api',
    'views/home',
    'views/notfound',
    'views/project/list',
    'views/project',
    'views/registration',
    'views/settings',
    'jquery',
    'underscore',
    'backbone'
], (ViewApi, ViewHome, ViewNotfound, ViewProjectList, ViewProject, ViewRegistration, ViewSettings, $, _, Backbone) ->
    
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

        'home': ->
            homePage = new ViewHome
            homePage.render()
            

        'registration': ->
            registrationPage = new ViewRegistration
            registrationPage.render()

        'settings': ->


            if Backbone.account.get 'authorized'
                settingsPage = new ViewSettings
                settingsPage.render()
            else 
                @redirect 'home'

            Backbone.on 'unauthorized', => @redirect 'home'

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

        redirect: (page) ->
            url = _.invert(@routes)[page]
            @navigate url
            @[page]?()
