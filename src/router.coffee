define [
    'collections/file',
    'collections/project',
    'layout',
    'models/project',
    'regions/main',
    'views/home',
    'views/project/list',
    'views/project',
    'jquery',
    'backbone'
], (CollectionFile, CollectionProject, Layout, ModelProject, RegionMain, ViewHome, ViewProjectList, ViewProject, $, Backbone) ->

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
            projectList.on 'reset', ->
                console.log projectList.toJSON( )

        # project/:id
        project: (id) ->

            project = new ModelProject
                id: id

            files = new CollectionFile
                projectID: id
                localeID: 1 # zh-tw

            projectView = new ViewProject
                model: project
                collection: files                

            RegionMain.show projectView
            project.fetch()
            files.fetch()





    return new Router