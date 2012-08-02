define ['underscore', 'backbone', '../models/file'], (_, Backbone, Model) ->

    class Collection extends Backbone.Collection

        initialize: (options) ->
            @pid = options.pid

        model: Model

                    


        url: -> 
            "/api/projects/#{ @pid }/files"