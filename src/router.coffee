define [
    'layout',
    'regions/main',
    'views/home',
    'views/project/list',
    'jquery',
    'backbone'
], (Layout, RegionMain, ViewHome, ViewProjectList, $, Backbone) ->

    class Router extends Backbone.Router

        initialize: ->
            console.log 'rendering layout at the router'
            Layout.render()
            $('body').html $(Layout.el).children()

        routes:
            ''              : 'home'
            'project'       : 'projectList'
            'project/:id'   : 'project'

        # 
        home: ->
            homeView = new ViewHome
            RegionMain.show homeView

        # project
        projectList: ->
            projectListView = new ViewProjectList
            RegionMain.show projectListView

        # project/:id
        project: (id) ->
            console.log id


    return new Router