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
            @render()


            @collection = new CollectionProject

            @listenTo @collection, 'get', @renderList
            @collection.fetch()
            

        render: -> @$el.html @template.render()


        renderList: ->

            itemTemplate = $$.projectListitem

            itemView = @collection.map (model) -> itemTemplate.render model.toJSON()

            console.log @collection.toJSON()

            $('#project-list-container', @$el).html itemView.join('')
