define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model
        
        defaults: 
            files: []


        # events: ->
        #     'change:fileOrdering': changeFileOrdering

        # changeFileOrdering: ->
        # console.log(@get 'fileOrdering')
        # Backbone.settings.fileOrdering = @get 'fileOrdering'            