define [
    'backbone'
], (Backbone) ->

    class Model extends Backbone.Model
        initialize: ->
            console.log 'banana'