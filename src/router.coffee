define [
    'views/home',
    'views/project/list',
    'jquery',
    'backbone'
], (ViewHome, ViewProjectList, $, Backbone) ->


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
            'project'       : 'projectList'
            # 'project/:id'   : 'project'

        # 
        home: ->
            homeView = new ViewHome
            $('#main').html homeView.el


        projectList: ->
            projectListView = new ViewProjectList
            $('#main').html projectListView.el


    return new Router