define [
    'backbone'
], (Backbone) ->
    


        
    class Collection extends Backbone.Collection

        url: -> "/api/po_files/#{ @id }/entries/page/0"






