define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.home


        render: ->
            console.log 'render home'

            @$el.html @template.render()    
            return @
