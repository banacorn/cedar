define [
    'views/project/listitem',
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], (ViewProjectListitem, $, Backbone, $$) ->

    class ProjectList extends Backbone.Marionette.CompositeView
        tagName: 'article'
        id: 'project-list'
        template: $$.projectList

        itemView: ViewProjectListitem
        itemViewContainer: 'ol'

