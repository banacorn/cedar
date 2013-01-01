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
            @template       = $$.project
            @projectList    = new CollectionProject
            @breadcrumb     = new ModelProjectBreadcrumb            
            @breadcrumbView = new ViewProjectBreadcrumb
                model: @breadcrumb

            @fileTree       = new CollectionFiletree
            @BrowserView    = new ViewProjectBrowser
                collection: @fileTree
            
        render: (name, path) ->

            @projectList.snatch =>

                # get project
                project = @projectList.where({name: name})[0]
                @$el.html @template.render
                    projectName: project.get 'name'
                    projectInfo: project.get 'info'

                # breadcrumb
                @breadcrumb.path path
                @breadcrumb.set 'projectName', name
                @assign @breadcrumbView, '#project-breadcrumb'

                # filebrowser                    
                @fileTree.id = project.id
                @fileTree.path = path
                @fileTree.name = name
                @assign @BrowserView, '#project-browser'

                @fileTree.snatch()




            return @
    
    
