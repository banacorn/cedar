define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
    'collection'
    'voir'
], ($, _, Backbone, hogan, template, model, collection, view) ->
    

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template       = template.project
            @projectList    = new collection.Project
            console.log view
            @breadcrumb     = new model.ProjectBreadcrumb            
            @breadcrumbView = new view.ProjectBreadcrumb
                model: @breadcrumb

            @fileTree       = new collection.FileTree
            @fileBrowserView = new view.FileBrowser
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
    
    
