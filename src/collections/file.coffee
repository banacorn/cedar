define [
    'backbone'
], (Backbone) ->

    class ProjectLocale extends Backbone.Model
        url: -> "/api/project_locales/#{ @id }"

    class Files extends Backbone.Collection
        url: -> "/api/po_files/#{ @projectID }"

        initialize: (option) ->

            @projectID = option.projectID
            @localeID = option.localeID

            # find project locale
            projectLocale = new ProjectLocale
                id: @projectID

            projectLocale.fetch()
            projectLocale.on 'sync', ->

                console.log projectLocale.toJSON()


