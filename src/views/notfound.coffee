define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class View extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.notfound

            
    
        render: (path) ->
            @$el.html @template.render
            	path: path
    
            return @
