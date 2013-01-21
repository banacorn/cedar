define [
    'views/home',
    'views/project/list',
    'jquery',
    'backbone'
], (ViewHome, ViewProjectList, $, Backbone) ->
    class Router extends Backbone.Router

        routes:
            ''          : 'home'
            'project'   : 'project'

        # /
        home: ->
            homeView = new ViewHome
            $('body').html homeView.render()

        # /project
        project: ->
            projectListView = new ViewProjectList
            $('body').html projectListView.render()



    return new Router