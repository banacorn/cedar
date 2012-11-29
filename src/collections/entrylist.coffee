define [
    'models/entrylist',
    'backbone'
], (ModelEntrylist, Backbone) ->
    
    class Collection extends Backbone.Collection
        model: ModelEntrylist

        url: -> "/api/po_files/#{ @id }/entry_ids"

        parse: (data) -> data.map (entryID) -> id: entryID






