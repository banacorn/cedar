define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model
        initialize: ->

            if @get('filetype') is 0
                @set 'folder', true
            else
                @set 'folder', false