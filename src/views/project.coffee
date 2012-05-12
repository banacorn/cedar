define ['jquery', 'underscore', 'backbone', 'hogan'
    'text!../../templates/project.html'
], ($, _, Backbone, hogan, template) ->
    
    
    class Model extends Backbone.Model
    
    
    class Collection extends Backbone.Collection
        model: Model
        url: '/projects'
        
        parse: (modles) ->
            @add modles
            @trigger 'ready'

    class Project extends Backbone.View
    
        initialize: ->
        
            @template = hogan.compile template
            @collection = new Collection
            
    
        render: ->
        
            @collection.fetch()
            
            @collection.on 'ready', =>
                console.log @collection.toJSON()
                $('#main').html @template.render
                    projects: @collection.toJSON()
    
    
    
    
    
