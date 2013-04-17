define [
    'backbone'
], (Backbone) ->

    class Project extends Backbone.Model
        url: -> "/api/projects/#{ @id }"

        parse: (data) ->
            name: data.name
            info: data.info
            id: data.id
            fileType: data.file_type
            isEmpty: data.num_of_entries is 0
            numberOfEntries: data.num_of_entries
            numberOfUnpickedEntries: data.num_of_unpicked_entries
            numberOfUntranslatedEntries: data.num_of_untranslated_entries
            locales: data.project_locales
            tags: data.tags
