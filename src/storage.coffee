define [], () ->
    (method, model, options) -> 
    
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url
    
    
        switch method
            when 'read'
                
                # fetch localStorage
                if localStorage[url]?
                    console.log 'cached: ', localStorage[url], Date.now()
                    data = JSON.parse localStorage[url]
                    model.reset data                    
                    
                # update localStorage
                model.on 'reset', ->
                    console.log 'updated: ', model.toJSON(), Date.now()
                    localStorage[url] = JSON.stringify model.toJSON()
