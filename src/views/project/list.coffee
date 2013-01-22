define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    class ProjectList extends Backbone.Marionette.ItemView
        template: $$.projectList
