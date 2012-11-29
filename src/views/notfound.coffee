define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class View extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.notfound

            
    
        render: (path) ->
            @$el.html @template.render
            	path: path
    
            return @
