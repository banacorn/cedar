define [
    'views/home',
    'views/project/list',
    'views/registration',
    'jquery',
    'backbone'
], (ViewHome, ViewProjectList, ViewRegistration, $, Backbone) ->


    # save the original Backbone.Sync here
    Backbone.remoteSync = Backbone.sync

    # modified Backbone.Sync that will check localStorage cache first
    Backbone.sync = (method, model, option) ->

        # get url, could be a value or a function
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url

        switch method
            when 'read'


                # update localStorage if synced from remote
                model.on 'reset', ->
                    localStorage[url] = JSON.stringify model.toJSON()

                # fetch localStorage
                if localStorage?[url]?

                    data = JSON.parse localStorage[url]

                    if model instanceof Backbone.Collection
                        model.reset data
                    if model instanceof Backbone.Model
                        model.set data

            when 'create'
                localStorage?[url] = JSON.stringify model.toJSON()
            when 'update'
                localStorage?[url] = JSON.stringify model.toJSON()

        Backbone.remoteSync.apply @, arguments

    class Router extends Backbone.Router

        routes:
            ''              : 'home'
            'registration'  : 'registration'
            'project'       : 'projectList'

        initialize: ->

            # remove the class 'container' if the page is "wide"
            @on 'all', (path) ->
                if /^route:home$/.test path
                    $('#main').removeClass 'container'
                else
                    $('#main').addClass 'container'
        home: ->
            homeView = new ViewHome
            $('#main').html homeView.el


        registration: ->
            registrationView = new ViewRegistration
            $('#main').html registrationView.el

        projectList: ->
            projectListView = new ViewProjectList
            $('#main').html projectListView.el


    return new Router