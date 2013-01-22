define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    # customize marionette.renderer::render
    # placed here because this is the earliest module loaded
    Backbone.Marionette.Renderer.render = (template, data) -> template.render data

    class Layout extends Backbone.Marionette.Layout
        template: $$.layout
        regions:
            main: '#main'

    layout = new Layout
    return layout