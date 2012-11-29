define [
    'models/locale',
    'backbone'
], (ModelLocale, Backbone) ->
    
    class Collection extends Backbone.Collection

        model: ModelLocale

        url: -> "/api/projects/#{ @id }/locales"

        parse: (data) -> data.map (locale) ->
            id: locale.id
            localeID: locale.locale.id
            localeName: locale.locale.name






