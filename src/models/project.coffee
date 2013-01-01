define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model

        numberOfFiles: ->
            yggdrasil = Backbone.Stat.get "yggdrasil-#{@id}"
            @set 'numberOfFiles', yggdrasil.numberOfFiles
