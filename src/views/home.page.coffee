define ['jquery', 'underscore', 'backbone', 'hogan'
    'text!../../templates/home.page.html'
    '../resource'
], ($, _, Backbone, hogan, template, resource) ->

    class HomePage extends Backbone.View
        
        el: $('#main')
        
        initialize: ->        
            @template = hogan.compile template
            @collection = new resource.Projects
    
        render: ->
        
                   
            
            @collection.fetch()
            
            @collection.on 'reset', =>
                @$el.html @template.render
                    projects: @collection.toJSON()
    
    
    
            
    
            return @
