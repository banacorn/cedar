define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.home

            # window.account.on 'authorzized', ->
                # console.log window.account.attributes
    
        render: ->
            @$el.html @template.render()
    
            return @
