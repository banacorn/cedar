define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class ProjectList extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.projectList
            @projects = new model.ProjectList

            
    
        render: ->

            @projects.snatch =>  
                @$el.html @template.render
                    projects: @projects.toJSON()

            return @
