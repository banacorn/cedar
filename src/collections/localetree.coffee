define [
    'models/localetree',
    'backbone'
], (ModelLocaletree, Backbone) ->
    
        
    class Collection extends Backbone.Collection
        model: ModelLocaletree

        url: -> "/api/project_locales/#{ @id }/po_files"

        parse: (data) -> 
        	data





