define [
    'collections/project',
    'jquery',
    'backbone',
    'template'
], (CollectionProject, $, Backbone, $$) ->

    class ProjectList extends Backbone.View

        tagName: 'article'
        id: 'project-list'
        template: $$.projectList

        initialize: -> 
            @collection = new CollectionProject

            @listenTo @collection, 'get', @renderList
            @collection.fetch()

            @render()
        render: -> @$el.html @template.render()

        renderList: ->
            console.log 'got list'
            console.log @collection.toJSON()