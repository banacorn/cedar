define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class Home extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.home

            
    
        render: ->
            @$el.html @template.render()
    
            return @
