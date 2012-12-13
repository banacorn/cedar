define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.settings

            
    
        render: ->
            @$el.html @template.render()
    
            return @
