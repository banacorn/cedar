define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    class ProjectListItem extends Backbone.Marionette.ItemView
        tagName: 'li'
        className: 'project-list-item'
        template: $$.projectListitem
