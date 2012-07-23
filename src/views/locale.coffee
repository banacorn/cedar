define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, model) ->
    
        

    class Locale extends Backbone.View
    
        #tagName: 'section'
        el: '#locales'
    
        initialize: ->
            @template = template.locale
            
        render: (id, pname, callback) ->
        
            @collection = new model.Locales
                id: id
            
            
            
            @collection.hol =>                                   
            
                
                json = @collection.map((n) ->
                    n.set 'pname', pname
                ).map((model) ->
                    model.toJSON()
                )
                
                callback @template.render
                    locales: json
                    
            return @
    
    
