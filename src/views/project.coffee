define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
    'views/projectbreadcrumb'
    'views/projectfilebrowser'
], ($, _, Backbone, hogan, template, MODEL, projectBreadcrumb) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template       = template.project
            @projectList    = new MODEL.ProjectList
            @fileTree       = new MODEL.FileTree
            @locales        = new MODEL.Locales
            @localeTree     = new MODEL.LocaleTree

            @breadcrumb     = new MODEL.ProjectBreadcrumb            
            @breadcrumbView = new projectBreadcrumb
                model: @breadcrumb
            



        render: (name, path) ->


            @projectList.snatch =>
                # get project
                project = @projectList.where({name: name})[0]

                @$el.html @template.render
                    projectName: project.get 'name'
                    projectInfo: project.get 'info'



                # breadcrumb
                @breadcrumb.path path
                @breadcrumb.set 'projectName', project.get 'name'
                @assign @breadcrumbView, '#project-breadcrumb'


                @locales.id = project.id
                @locales.snatch =>



                    # get zh_TW 
                    project.locale = @locales.where({localeID: 1})[0].get 'id'

                    # set filetree's id
                    @fileTree.id = project.id

                    @fileTree.snatch =>

                        # get the children
                        children = @fileTree.children path
                        node = @fileTree.node path



                        #
                        #   locale files
                        #
                        if node? and not node.folder
                            @localeTree.id = project.locale
                            @localeTree.snatch =>
                                entryListID = @localeTree.where({ project_file_id: node.id })[0].get 'id'
                                entryList = new MODEL.EntryList
                                entryList.id = entryListID
                                entryList.snatch =>



                        if path isnt ''
                            root = path + '/'
                        else
                            root = ''

                        # @$el.html @template.render
                        #     projectName : project.get 'name'
                        #     projectInfo : project.get 'info'
                        #     id          : project.id
                        #     files       : children
                        #     root        : root





            return @
    
    
