define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template = template.project
            @collection = new MODEL.Projects
        render: (name) ->

            @collection.snatch =>
                console.log name
                model = @collection.where({name: name})[0]
                @$el.html @template.render
                    name: model.get 'name'
                    info: model.get 'info'
                    id  : model.id

            return @
    
    
