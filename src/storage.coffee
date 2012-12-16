define [
    'backbone'
], (Backbone) ->
    (method, model, options) -> 
    
        # the url could be a value or a function
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url

        switch method
            when 'read'




                # update localStorage
                model.on 'reset', ->
                    localStorage[url] = JSON.stringify model.toJSON()

                # model.on 'sync', ->
                #     console.log '========== update cache from fetched data ================='
                #     console.log 'cache', localStorage[url]
                #     console.log 'fetch', JSON.stringify model.toJSON()
                #     localStorage[url] = JSON.stringify model.toJSON()
                    
                # fetch localStorage
                if localStorage?[url]?
                    data = JSON.parse localStorage[url]
                    # if model instanceof Backbone.Model
                    #     model.set data
                    #     console.log 'loading data from cache'
                    if model instanceof Backbone.Collection
                        model.reset data
