define [
    'collections/project',
    'jquery',
    'backbone',
    'template'
], (CollectionProject, $, Backbone, $$) ->

    class ProjectList extends Backbone.View
        

        el: $('#main')
        
        render: ->

            projects = new CollectionProject
            projects.snatch =>  
                @$el.html $$.projectList.render
                    projects: projects.toJSON()

            return @
