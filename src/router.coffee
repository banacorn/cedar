define [
    'collections/project',
    'layout',
    'regions/main',
    'views/home',
    'views/project/list',
    'jquery',
    'backbone'
], (CollectionProject, Layout, RegionMain, ViewHome, ViewProjectList, $, Backbone) ->

    class Router extends Backbone.Router

        initialize: ->
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

            projectList = new CollectionProject
            projectListView = new ViewProjectList
                collection: projectList
            RegionMain.show projectListView
            projectList.fetch()

        # project/:id
        project: (id) ->
            console.log id



    return new Router