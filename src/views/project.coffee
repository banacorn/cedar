define ['jquery', 'underscore', 'backbone', 'hogan'
    'text!../../templates/project.html'
    '../resource'
], ($, _, Backbone, hogan, template, resource) ->
    
        

    class Project extends Backbone.View
    
        initialize: ->
            @template = hogan.compile template
            @collection = new resource.Projects
            
        render: ->
            @collection.fetch()
                          
            @collection.on 'reset', =>
                $('#main').html @template.render
                    projects: @collection.toJSON()
    
    
    
    
    
