define [
    'storage',
    'jquery',
    'underscore',
    'backbone'
], (Storage, $, _, Backbone) ->


    # sync machanism
    Backbone.remoteSync = Backbone.sync
    Backbone.sync = ->
        Backbone.remoteSync.apply @, arguments  # original
        Storage.apply @, arguments  # additional (localStorage)


    # Backbone.Model::snatch = (callback, args) ->
    #     console.log 'snatch'

    #     if callback?
    #         @once 'sync', callback

    #     args = {} if not args?


    #     parameters = _.extend args, 
    #         silent: true
    #         success: (model, response) ->

    #             console.log 'fetched'

    #             # invoke the callback only when data changed
    #             url = model.url?() || model.url
    #             cache = localStorage[url]

    #             if not cache? or not _.isEqual model.toJSON(), JSON.parse cache
    #                 console.log '========  snatch ================'
    #                 console.log 'cache', JSON.parse cache
    #                 console.log 'fetched', model.attributes
    #                 console.log 'data fetched differs from cache, triggering event '
    #                 model.trigger 'sync'
    #             else
    #                 console.log 'same as cache'

    #     @fetch parameters


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