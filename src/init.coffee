define [
    'backbone'
], (Backbone) ->
    
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
                model.once 'sync', ->

                    inLocalStorage = localStorage?[url]?

                    # emit event 'get' and update cache
                    if not inLocalStorage or localStorage[url] isnt JSON.stringify model.toJSON()

                        model.trigger 'get', JSON.stringify model.toJSON()
                        localStorage[url] = JSON.stringify model.toJSON()

                # fetch localStorage
                if localStorage?[url]?

                    data = JSON.parse localStorage[url]

                    if model instanceof Backbone.Collection
                        model.reset data
                    if model instanceof Backbone.Model
                        model.set data

                    # trigger event 'get'
                    model.trigger 'get'


            when 'create'
                localStorage?[url] = JSON.stringify model.toJSON()
            when 'update'
                localStorage?[url] = JSON.stringify model.toJSON()

        arguments[2].silent = true

        Backbone.remoteSync.apply @, arguments