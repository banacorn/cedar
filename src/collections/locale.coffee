define [
    'models/locale',
    'underscore',
    'backbone'
], (ModelLocale, _, Backbone) ->
    
    class Collection extends Backbone.Collection

        model: ModelLocale

        url: -> "/api/project_locales/#{ @id }"

        parse: (data) -> 
            if _.isArray data
                return data.map (locale) ->
                    id: locale.id
                    localeID: locale.locale.id
                    localeName: locale.locale.name
            else 
                return []




