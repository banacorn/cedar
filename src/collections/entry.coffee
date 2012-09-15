define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model


        
    class Collection extends Backbone.Collection

        model: Model

        url: -> "/api/po_files/#{ @id }/entries/page/0"






