define [
    'collections/filetree',
    'collections/project',
    'models/project/breadcrumb',
    'views/filebrowser',
    'views/project/breadcrumb',
    'jquery',
    'backbone',
    'template'
], (CollectionFiletree, CollectionProject, ModelProjectBreadcrumb, ViewFilebrowser, ViewProjectBreadcrumb, $, Backbone, $$) ->
    

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template       = $$.project
            @projectList    = new CollectionProject
            @breadcrumb     = new ModelProjectBreadcrumb            
            @breadcrumbView = new ViewProjectBreadcrumb
                model: @breadcrumb

            @fileTree       = new CollectionFiletree
            @fileBrowserView = new ViewFilebrowser
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
                @assign @fileBrowserView, '#project-file'

                @fileTree.snatch()




            return @
    
    
