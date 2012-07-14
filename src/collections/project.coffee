define ['underscore', 'backbone', '../models/project'], (_, Backbone, Model) ->
    
        
    class Collection extends Backbone.Collection
        model: Model
        url: 'http://itswindtw.info:9000/projects.json'
        
