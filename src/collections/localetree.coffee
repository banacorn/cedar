define [
    'models/localetree',
    'backbone'
], (ModelLocaletree, Backbone) ->
    
        
    class Collection extends Backbone.Collection
        model: ModelLocaletree

        url: -> "/api/po_files?project_locale_id=#{ @id }"
        parse: (data) -> 
            data




