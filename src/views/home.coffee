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
                    
            @collection.on 'reset', =>
            
                console.log 'collection reseted', Date.now()
            
                @$el.render @template.render
                    projects: @collection.toJSON()
                
            console.log 'request issued ', Date.now()
            @collection.fetch()
            
    
            return @
