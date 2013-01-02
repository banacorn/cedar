define [
    'collections/project',
    'views/stat',
    'jquery',
    'backbone',
    'template'
], (CollectionProject, ViewStat, $, Backbone, $$) ->

    class ProjectList extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = $$.projectList
            @projects = new CollectionProject

            
    
        render: ->

            @projects.snatch =>
                
                @projects.each (project) ->
                    numberOfFiles = project.numberOfFiles()
                    stat = new ViewStat
                    stat.render(project.id, numberOfFiles)

                @$el.html @template.render
                    projects: @projects.toJSON()
            return @
