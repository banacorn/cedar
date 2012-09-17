define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
    'views/projectbreadcrumb'
    'views/filebrowser'
], ($, _, Backbone, hogan, template, MODEL, ProjectBreadcrumb, FileBrowser) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template       = template.project
            @projectList    = new MODEL.ProjectList

            @breadcrumb     = new MODEL.ProjectBreadcrumb            
            @breadcrumbView = new ProjectBreadcrumb
                model: @breadcrumb

            @fileTree       = new MODEL.FileTree
            @fileBrowserView = new FileBrowser
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
    
    
