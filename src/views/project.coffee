define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, model) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: (name) ->
            @template = template.project
            @collection = new model.Projects
            @name = name
                
        render: ->
            
            
            @collection.hol =>
            
                @model = @collection.where(
                    name: @name
                )[0]          
                @$el.render @template.render
                        name: @model.get 'name'
                        info: @model.get 'info'
                        id  : @model.id
                ###localeView.render @model.id, @model.get('name'), (content) =>
                          
                    
                ###                  
            return @
    
    
