define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model


        
    class Collection extends Backbone.Collection
        model: Model
        url: -> "/api/projects/#{ @id }/files"

        initiailze: (projectID) ->
            console.log 'file tree id is ', projectID

        parse: (data) ->
            data ?= []

            models = []
            fold = (tree, level) ->
                for node in tree
                    node.level = level
                    if node.filetype is 0 
                        node.folder = true
                    else
                        node.folder = false

                    if node.children
                        fold node.children, level + 1
                    delete node.children

                    models.push node
            fold data, 0

            return models


