define ['underscore', 'backbone', '../models/project'], (_, Backbone, Model) ->
    
        
    class Collection extends Backbone.Collection
        model: Model
        url: '/api/projects'
        parse: (data) ->

            models = []
            fold = (tree) ->
                for node in tree
                    if node.children
                        fold node.children
                    delete node.children

                    models.push node
            fold data

            return models