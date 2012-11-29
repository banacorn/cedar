define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class View extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.api

            
    
        render: ->
            # console.log @template.render()
            @$el.html @template.render()

            return @
