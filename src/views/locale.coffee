define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, model) ->
    
        

    class Locale extends Backbone.View
    
        #tagName: 'section'
        el: '#locales'
    
        initialize: ->
            @template = template.locale
            
        render: (id, pname) ->
            @collection = new model.Locales
                id: id
            
            
            
            @collection.on 'reset', =>                                   
                
                json = @collection.map((n) ->
                    n.set 'pname', pname
                ).map((model) ->
                    model.toJSON()
                )
                
                $('#locales').render @template.render
                    locales: json
                    
            @collection.fetch()
                    
            return @
    
    
