define ['underscore', 'backbone', '../models/locale'], (_, Backbone, Model) ->
    
        
    class Collection extends Backbone.Collection
        model: Model
        url: () -> "http://itswindtw.info:9000/projects/#{ @id }/locales.json"
        initialize: (options) ->
            @id = options.id
        
