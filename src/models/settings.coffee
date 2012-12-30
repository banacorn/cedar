define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model

        url: 'local/settings'

        defaults:
            'fileOrdering': 'list'

        initialize: ->
            @fetch()
            @on 'change', (model) ->
                model.save()

