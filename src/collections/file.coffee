define [
    'underscore',
    'backbone'
], (_, Backbone) ->


    class ProjectLocale extends Backbone.Model
        url: -> "/api/project_locales/?project_id=#{ @id }"
        parse: (locales) ->
            trees = {}
            _(locales).forEach (locale) ->
                trees[locale.tlocale.id] = 
                    treeID: locale.id
                    localeName: locale.tlocale.name
            return trees


    class Files extends Backbone.Collection
        url: -> "/api/po_files/?project_id=#{ @treeID }"

        initialize: (option) ->

            @projectID = option.projectID
            @localeID = option.localeID

            # find project locale
            projectLocale = new ProjectLocale
                id: @projectID



            # projectLocale.fetch()
            projectLocale.on 'sync', =>
                @treeID = projectLocale.toJSON()[@localeID].treeID

                @fetch()

                @on 'sync', =>
                    console.log 'fuck'
                    console.log @toJSON()