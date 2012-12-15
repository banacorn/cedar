define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.home

            @listenTo Backbone, 'authorize', @render

        render: ->
            @$el.html @template.render
                authorized: Backbone.authorized
    
            return @
