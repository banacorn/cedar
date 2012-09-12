define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model
        initialize: ->

            if @get('filetype') is 0
                @set 'folder', true
            else
                @set 'folder', false

            # path
            path = @get('filepath') + '/' + @get 'name'
            path = _.tail(path.split('/')).join '/'
            @set 'path', path
        
    class Collection extends Backbone.Collection
        model: Model
        url: -> "/api/projects/#{ @id }/files"

        parse: (data) ->
            data ?= []

            models = []
            fold = (tree, level) ->
                for node in tree
                    node.level = level
                    if node.children.length isnt 0
                        fold node.children, level + 1
                    delete node.children

                    models.push node
            fold data, 0

            return models

        children: ->

            #   level '' = 0
            #   level 'a' = 1
            #   level 'a/' = 1
            #   level 'a/a' = 2

            level = _.compact(@path.replace(/\/$/, '').split('/')).length
            return @where({ level: level }).map (model) -> model.toJSON()

        node: -> @where({ path: @path })[0]?.toJSON()

        root: ->
            if @path isnt ''
                return @path + '/'
            else
                return ''