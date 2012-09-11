define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model


        
    class Collection extends Backbone.Collection
        model: Model

        url: -> "/api/projects/#{ @id }/locales"

        parse: (data) ->
            
            return data


