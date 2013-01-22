define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    class Home extends Backbone.Marionette.ItemView
        template: $$.home
