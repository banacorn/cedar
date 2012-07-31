define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
        

    class File extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template = template.file
            @projects = new MODEL.Projects
                
        render: (name) ->

            @projects.hol =>

                pid = @projects.where({name: name})[0].id
                
                console.log pid

                files = new MODEL.Files
                    pid: pid
                $.get "projects/#{ pid }/files.json", (reply) =>
                    
                    @$el.html @template.render
                        test: JSON.stringify reply


            return @
    
    
