define [
    'backbone'
], (Backbone) ->
    


        
    class Collection extends Backbone.Collection

        url: -> "/api/entries?po_file_id=#{ @id }&page=0"






