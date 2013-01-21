require.config
    paths:
        jquery      : 'jam/jquery/jquery'
        underscore  : 'jam/underscore/underscore'
        backbone    : 'jam/backbone/backbone'
        # 'backbone.marionette'    : 'jam/Backbone.Marionette/lib/amd/backbone.marionette'
        hogan       : 'jam/hogan/hogan'        
        router      : 'router'
        template    : 'template'
require [
    'router',
    'jquery',
    'backbone'
], (Router, $, Backbone) ->

    class App extends Backbone.View

        # enables history api pushstate
        # acient IE fallback to hashbang #!
        enablePushState: ->
            Backbone.history.start
                pushState: true


        # disables anchors
        # let the Router handle this
        disableAnchor: ->

            $('a').live 'click', ->
                urn = $(@).attr('href')
                Router.navigate urn, true
                return false


    app = new App


    $ ->

        # inits
        app.enablePushState();
        app.disableAnchor();