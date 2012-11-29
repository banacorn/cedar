
define [
    'collections/entry',
    'collections/locale',
    'collections/localetree',
    'views/entry',
    'jquery',
    'backbone',
    'template'
], (CollectionEntry, CollectionLocale, CollectionLocaletree, ViewEntry, $, Backbone, $$) ->
    
    

    class ProjectBreadcrumb extends Backbone.View
        

        tagName: 'ol'

        initialize: ->
            @collection.on 'reset', => @render()
            @view = 
                Entries: ViewEntry
        render: ->

            @template = $$.filebrowser

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
                locales = new CollectionLocale
                locales.id = projectID
                locales.snatch =>

                    # get zh-tw
                    projectLocaleID = locales.where({localeID: 1})?[0].get 'id'
                    
                    # get locale-tree
                    localeTree = new CollectionLocaletree
                    localeTree.id = projectLocaleID
                    localeTree.snatch =>
                        # match it with current page
                        projectFileID = @collection.node().id
                        fileID = localeTree.where({'project_file_id': projectFileID})?[0].get 'id'

                        entries = new CollectionEntry
                        entries.id = fileID
                        entriesView = new ViewEntry
                            collection: entries
                        @assign entriesView, '#project-file'

                        entries.snatch()


            return @