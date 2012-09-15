define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model


        
    class Collection extends Backbone.Collection
        model: Model

        url: -> "/api/project_locales/#{ @id }/po_files"

        parse: (data) -> 
        	data





