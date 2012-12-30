define [
    'backbone'
], (Backbone) ->
    (method, model, options) -> 
    
        console.log method, model.toJSON()

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
