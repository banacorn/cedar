define ['underscore', 'backbone', 'model'], (_, Backbone, model) ->
    
        
    class Collection extends Backbone.Collection
        model: model.Project
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