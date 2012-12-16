define [
    'backbone'
], (Backbone) ->
    (method, model, options) -> 
    
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url

        switch method
            when 'read'
                # update localStorage
                model.on 'reset', ->
                    localStorage[url] = JSON.stringify model.toJSON()

                model.on 'change', ->
                    localStorage[url] = JSON.stringify model.toJSON()
                
                # fetch localStorage
                if localStorage?[url]?
                    data = JSON.parse localStorage[url]
                    if model instanceof Backbone.Model
                        model.set data
                    if model instanceof Backbone.Collection
                        model.reset data
