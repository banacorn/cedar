define [
    'collections/entry',
    'collections/locale',
    'collections/localetree',
    'collections/project',
    'jquery',
    'underscore',
    'backbone'
], (CollectionEntry, CollectionLocale, CollectionLocaletree, CollectionProject, $, _, Backbone) ->

    class Model extends Backbone.Model

        defaults: 
            'project-size': undefined


        initialize: ->

            @cellar()


            @getAllProjects()

        cellar: ->

            # get it out from the local storage
            for key, value of localStorage
                if /^local\/stat\/.*/.test key
                    key = key.substr(11)
                    data = JSON.parse value

                    @set key, data

            # store it back on change
            @on 'change', =>

                prefix = 'local/stat/'

                for key, value of @attributes
                    localStorage[prefix + key] = JSON.stringify value


        fold: (tree, func, id) ->

            if tree?
                poop = tree.children
                    .map((child) => @fold(child, func, id))
                    .reduce(((a, b) -> a + b), 0)

                func(tree, poop, id) + poop
            else
                0     


        getAllProjects: ->

            @entriesLeft = {}
            @entriesLeftCB = {}


            fold = (tree, func, id) ->

                if tree?
                    poop = tree.children
                        .map((child) -> fold(child, func, id))
                        .reduce(((a, b) -> a + b), 0)

                    func(tree, poop, id) + poop
                else
                    0            

            numberOfFileFunc = (tree, poop) ->
                a = 0
                tree.numberOfFiles = poop
                if tree.filetype is 1
                    a = 1

                return a

            insertPoFileID = (tree, poop, table) =>
                if tree.filetype is 1
                    tree.po_file_id = _.find(table, (a) -> a.project_file_id is tree.id)?.id

            snatchEntries = (tree, poop, id) =>
                if tree.filetype is 1
                    entries = new CollectionEntry
                    entries.id = tree.po_file_id
                    entries.snatch =>
                        tree.entries = entries.toJSON()
                        tree.numberOfEntries = entries.length
                        if id?
                            @entriesLeft[id] -= 1
                        @entriesLeftCB[id]()

            countEntries = (tree, poop) =>
                numberOfEntries = 0
                if tree.numberOfEntries?
                    numberOfEntries = tree.numberOfEntries
                else
                    tree.numberOfEntries = poop
                numberOfEntries

            allProjects = new CollectionProject
            allProjects.snatch =>


                allProjectSize = allProjects.length
                @set 'project-size', allProjectSize

                # allProjects = allProjects
                allProjects.each (project) =>

                    $.get "/api/project_files/?project_id=#{ project.id }", (yggdrasil) =>
                        if yggdrasil.length isnt 0
                            yggdrasil = yggdrasil[0]
                            # of files
                            numberOfFiles = fold yggdrasil, numberOfFileFunc


                            locales = new CollectionLocale
                            locales.id = project.id
                            locales.snatch =>
                                        
                                # get zh-tw
                                projectLocaleID = locales.where({localeID: 1})?[0].get 'id'
                                # # get locale-tree
                                localeTree = new CollectionLocaletree
                                localeTree.id = projectLocaleID
                                localeTree.snatch =>
                                    fold yggdrasil, insertPoFileID, localeTree.toJSON()
                                    # console.log localeTree.toJSON().map((a) -> a.id)
                                    @entriesLeft[yggdrasil.id] = numberOfFiles
                                    @entriesLeftCB[yggdrasil.id] = =>
                                        if @entriesLeft[yggdrasil.id] is 0
                                            numberOfEntries = fold yggdrasil, countEntries
                                            @set "yggdrasil-#{project.id}", yggdrasil

                                    # fetch entries
                                    fold yggdrasil, snatchEntries, yggdrasil.id
                        else
                            @set "yggdrasil-#{project.id}",
                                numberOfFiles: 0
                                numberOfEntries: 0


