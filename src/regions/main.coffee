define [
    'main',
    'backbone',
    'backbone.marionette'
], (Main, Backbone) ->
    
    new class Main extends Backbone.Marionette.Region
        el: '#main'