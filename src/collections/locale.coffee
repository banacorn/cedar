define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model


        
    class Collection extends Backbone.Collection

        model: Model

        url: -> "/api/projects/#{ @id }/locales"

        parse: (data) -> data.map (locale) ->
            id: locale.id
            localeID: locale.locale.id
            localeName: locale.locale.name






