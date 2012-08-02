define ['underscore', 'backbone', '../models/locale'], (_, Backbone, Model) ->
    
        
    class Collection extends Backbone.Collection
        model: Model
        url: () -> "/api/projects/#{ @id }/locales"
        initialize: (options) ->
            @id = options.id
        
