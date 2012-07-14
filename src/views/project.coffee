define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, model) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: (name) ->
            @template = hogan.compile template.project
            @model = new model.Project
                
            
        render: ->
            
            @collection.on 'reset', =>
                @$el.html @template.render
                    projects: @collection.toJSON()
    
    
    
    
