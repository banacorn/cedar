define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            
    
        render: ->

            content = $$.settings
            @$el.html content.render()

            return @
