
define [
    'collections/entry',
    'collections/locale',
    'collections/localetree',
    'models/project/browser',
    'views/entry',
    'jquery',
    'backbone',
    'template'
], (CollectionEntry, CollectionLocale, CollectionLocaletree, ModelProjectBrowser, ViewEntry, $, Backbone, $$) ->
    
    

    class Browser extends Backbone.View
        

        tagName: 'ol'


        initialize: ->
            @collection.on 'reset', => @render()
            @model = new ModelProjectBrowser
            @view = 
                Entries: ViewEntry

            @listenTo Backbone.settings, 'change:fileOrdering', @eventFileOrdering

        eventFileOrdering: ->
            ordering = Backbone.settings.get 'fileOrdering'
            switch ordering
                when 'list'
                    @$el.removeClass('icon-ordering').addClass('list-ordering')
                when 'icon'
                    @$el.removeClass('list-ordering').addClass('icon-ordering')

        render: ->

            template = $$.projectBrowser

            isFile = @collection.node()?.folder is false
            
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

            else # is folder

                @$el.html template.render
                    isFile: isFile
                    files: @collection.children()
                    root: @collection.root()
                    projectName: @collection.name
                @eventFileOrdering() # init trigger
            return @