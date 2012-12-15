define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.home

            Backbone.on 'authorized', ->
                console.log 'authorized'
                console.log Backbone.authorized    
        render: ->
            @$el.html @template.render()
    
            return @
