define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    class File extends Backbone.Marionette.ItemView
        tagName: 'li'
        class: 'file'
        template: $$.file
        