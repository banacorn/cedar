define [
    'views/file',
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], (ViewFile, $, Backbone, $$) ->

    class Project extends Backbone.Marionette.CompositeView

        # project 
        template: $$.project
        tagName: 'section'
        id: 'project'

        # files
        itemView: ViewFile
        itemViewContainer: 'ol'
