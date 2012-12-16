define [
    'storage',
    'jquery',
    'underscore',
    'backbone'
], (Storage, $, _, Backbone) ->


    # sync machanism
    Backbone.remoteSync = Backbone.sync
    Backbone.sync = ->
        Backbone.remoteSync.apply @, arguments
        Storage.apply @, arguments


    Backbone.Model::snatch = (callback, args) ->

        if callback?
            @once 'change', callback
            
        args = {} if not args?


        parameters = _.extend args, 
            silent: true
            success: (model, response) ->
                # invoke the callback only when data changed
                url = model.url?() || model.url
                cache = localStorage[url]



                if not cache? or not _.isEqual model.toJSON(), JSON.parse cache
                    model.trigger 'change'



        @fetch parameters


    Backbone.Collection::snatch = (callback) ->

        if callback?
            @once 'reset', callback

        @fetch
            silent: true
            success: (collection, response) ->
                # invoke the callback only when data changed
                url = collection.url?() || collection.url
                cache = localStorage[url]

                if not cache? or not _.isEqual collection.toJSON(), JSON.parse cache
                    collection.trigger 'reset'

    Backbone.View::assign = (view, selector) ->
        view.setElement($(selector)).render()