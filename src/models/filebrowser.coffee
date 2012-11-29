define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model
        
        defaults: 
            files: []
