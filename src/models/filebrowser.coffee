define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model
        
        defaults: 
            files: []
