define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class View extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.api

            
    
        render: ->
            # console.log @template.render()
            @$el.html @template.render()

            return @
