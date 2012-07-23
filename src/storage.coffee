define [], () ->
    (method, model, options) -> 
    
        if typeof model.url is 'function'
            url = model.url()
        else
            url = model.url
    
    
        switch method
            when 'read'
                
                
                # fetch localStorage
                if localStorage?[url]?
                    data = JSON.parse localStorage[url]
                    model.reset data                  
                    
                # update localStorage
                model.on 'reset', ->
                    localStorage[url] = JSON.stringify model.toJSON()
