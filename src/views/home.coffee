define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class HomePage extends Backbone.View
        
        el: $('#main')
        
        initialize: ->        
            @template = template.home
            @collection = new model.Projects
    
        render: ->
        
                   
            
            @collection.fetch()
            
            @collection.on 'reset', =>
            
                @$el.fadeOut(100).hide().html(@template.render
                    projects: @collection.toJSON()
                ).fadeIn 100
    
            
    
            return @
