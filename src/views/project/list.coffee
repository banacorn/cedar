define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
    'collection'
], ($, _, Backbone, template, model, collection) ->

    class ProjectList extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.projectList
            @projects = new collection.Project

            
    
        render: ->

            @projects.snatch =>  
                @$el.html @template.render
                    projects: @projects.toJSON()

            return @
