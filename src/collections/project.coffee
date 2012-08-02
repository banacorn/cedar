define ['underscore', 'backbone', '../models/project'], (_, Backbone, Model) ->
    
        
    class Collection extends Backbone.Collection
        model: Model
        url: '/api/projects'
