define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model

        
    class Collection extends Backbone.Collection
        model: Model

        initialize: (entryList) ->
        	@entryList = entryList 
        	for entry in @entryList
        		@add new Model(entry)
        url: "/api/entries/"