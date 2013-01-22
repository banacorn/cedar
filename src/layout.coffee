define [
    'jquery',
    'backbone',
    'template',
    'backbone.marionette'
], ($, Backbone, $$) ->

    # save the original Backbone.Sync here
    Backbone.remoteSync = Backbone.sync

    # modified Backbone.Sync that will check localStorage cache first
    Backbone.sync = (method, model, option) ->

        # get url, could be a value or a function
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url

        switch method
            when 'read'


                # update localStorage if synced from remote
                model.on 'reset', ->
                    localStorage[url] = JSON.stringify model.toJSON()

                # fetch localStorage
                if localStorage?[url]?

                    data = JSON.parse localStorage[url]

                    if model instanceof Backbone.Collection
                        model.reset data
                    if model instanceof Backbone.Model
                        model.set data

            when 'create'
                localStorage?[url] = JSON.stringify model.toJSON()
            when 'update'
                localStorage?[url] = JSON.stringify model.toJSON()

        Backbone.remoteSync.apply @, arguments

    # customize marionette.renderer::render
    # placed here because this is the earliest module loaded
    Backbone.Marionette.Renderer.render = (template, data) -> template.render data

    class Layout extends Backbone.Marionette.Layout
        template: $$.layout
        regions:
            main: '#main'

    layout = new Layout
    return layout