define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model
        initialize: ->
            if @get 'filetype' is 0 
                @set 'folder', true
            else
                @set 'folder', false

        
    class Collection extends Backbone.Collection
        model: Model
        url: -> "/api/projects/#{ @id }/files"

        parse: (data) ->
            data ?= []

            models = []
            fold = (tree, level) ->
                for node in tree
                    node.level = level
                    

                    if node.children
                        fold node.children, level + 1
                    delete node.children

                    models.push node
            fold data, 0

            return models


