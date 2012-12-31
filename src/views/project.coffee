define [
    'collections/filetree',
    'collections/project',
    'models/project/breadcrumb',
    'views/project/breadcrumb',
    'views/project/browser',
    'jquery',
    'backbone',
    'template'
], (CollectionFiletree, CollectionProject, ModelProjectBreadcrumb, ViewProjectBreadcrumb, ViewProjectBrowser, $, Backbone, $$) ->
    

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            # @template       = $$.project
            # @projectList    = new CollectionProject
            # @breadcrumb     = new ModelProjectBreadcrumb            
            # @breadcrumbView = new ViewProjectBreadcrumb
            #     model: @breadcrumb

            # @fileTree       = new CollectionFiletree
            # @BrowserView = new ViewProjectBrowser
            #     collection: @fileTree
            
        render: (name, path) ->

            projects = new CollectionProject
            projects.snatch =>
                project = projects.where({name: name})[0]
                project.explore()

                @$el.html $$.project.render
                    projectName: project.get 'name'
                    projectInfo: project.get 'info'


                # breadcrumb
                breadcrumb = new ViewProjectBreadcrumb
                    path: path
                    projectName: name
                @assign breadcrumb, '#project-breadcrumb'

            #     # filebrowser                    
            #     @fileTree.id = project.id
            #     @fileTree.path = path
            #     @fileTree.name = name
            #     @assign @BrowserView, '#project-browser'

            #     @fileTree.snatch()




            # return @
    
    
