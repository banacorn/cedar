define [
    'collections/project',
    'jquery',
    'backbone',
    'template'
], (CollectionProject, $, Backbone, $$) ->

    class ProjectList extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.projectList
            @projects = new CollectionProject

            
    
        render: ->

            @projects.snatch =>  
                @$el.html @template.render
                    projects: @projects.toJSON()

            return @
