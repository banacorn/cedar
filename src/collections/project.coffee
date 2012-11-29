define [
    'models/project',
    'backbone'
], (ModelProject, Backbone) ->
    
        
    class Collection extends Backbone.Collection
        model: ModelProject
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