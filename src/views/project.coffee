define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
    'views/locale'
], ($, _, Backbone, hogan, template, model, LocaleView) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: (name) ->
            @template = template.project
            @collection = new model.Projects
            @collection.fetch()
            @name = name
                
        render: ->
            
            localeView = new LocaleView
            
            @collection.on 'reset', =>
                @model = @collection.where(
                    name: @name
                )[0]                    
                @$el.render @template.render
                    name: @model.get 'name'
                    info: @model.get 'info'
                    id  : @model.id
                    locales: localeView.render(@model.id, @model.get 'name').el
            
            return @
    
    
