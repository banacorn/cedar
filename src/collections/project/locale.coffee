define [
    'models/project/locale',
    'backbone'
], (ModelProjectLocale, Backbone) ->
    
        
    class Collection extends Backbone.Collection
        model: ModelProjectLocale

        url: -> "/api/projects/#{ @id }/locales"

        # parse: (data) -> 
        #   data





