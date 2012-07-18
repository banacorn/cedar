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
            
                @$el.render @template.render
                    projects: @collection.toJSON()
                
            
    
            return @
