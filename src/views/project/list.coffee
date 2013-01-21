define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class ProjectList extends Backbone.View
        template: $$.projectList
        render: -> @template.render()
