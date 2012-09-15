
define ['jquery', 'underscore', 'backbone', 'hogan', 'template', 'model', 'views/entry'
], ($, _, Backbone, hogan, template, MODEL, EntryView) ->
    
    

    class ProjectBreadcrumb extends Backbone.View
        

        tagName: 'ol'

        initialize: ->
            @collection.on 'reset', => @render()
            @model = MODEL
            @view = 
                Entries: EntryView
        render: ->

            @template = template.filebrowser

            isFile = @collection.node()?.folder is false
            @$el.html @template.render
                isFile: isFile
                files: @collection.children()
                root: @collection.root()
                projectName: @collection.name

            projectID = @collection.id
            fileID = @collection.node()


            if isFile
                # get project-locale id
                locales = new @model.Locales
                locales.id = projectID
                locales.snatch =>

                    # get zh-tw
                    projectLocaleID = locales.where({localeID: 1})?[0].get 'id'
                    
                    # get locale-tree
                    localeTree = new @model.LocaleTree
                    localeTree.id = projectLocaleID
                    localeTree.snatch =>

                        # match it with current page
                        projectFileID = @collection.node().id
                        fileID = localeTree.where({'project_file_id': projectFileID})?[0].get 'id'

                        entries = new @model.Entries
                        entries.id = fileID
                        entries.on 'reset', ->
                            console.log 'reset'
                        entries.snatch =>
                            # console.log entries.toJSON()


                            # entryIDs = _.pluck entryList.toJSON(), 'id'
                            # entryIDs.forEach (id) =>

                            #     entry = new @model.Entry
                            #         id: id
                            #     entryView = new @view.Entry

                            #     entry.snatch()


            return @