define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model

        
    class Collection extends Backbone.Collection
        model: Model

        url: -> "/api/po_files/#{ @id }/entry_ids"

        parse: (data) -> data.map (entryID) -> id: entryID






