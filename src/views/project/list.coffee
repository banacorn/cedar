define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class ProjectList extends Backbone.View

        tagName: 'section'
        id: 'project-list'
        template: $$.projectList

        initialize: -> @render()
        render: -> @$el.html @template.render()
