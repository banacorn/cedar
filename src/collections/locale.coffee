define [
    'models/locale',
    'underscore',
    'backbone'
], (ModelLocale, _, Backbone) ->
    
    class Collection extends Backbone.Collection

        model: ModelLocale

        url: -> "/api/project_locales/?project_id=#{ @id }"

        parse: (data) -> 
            if _.isArray data
                data = data.map (locale) ->
                    id: locale.id
                    localeID: locale.locale.id
                    localeName: locale.locale.name
            else 
                data = []




