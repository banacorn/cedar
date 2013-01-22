define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class ProjectListItem extends Backbone.View
        template: $$.projectListitem
        render: -> @template.render()
