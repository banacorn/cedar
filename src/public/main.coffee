class Container extends Backbone.View
    el: window
    
    fix: 'free'
    events:
        'resize': 'resize'
        'scroll': 'scroll'
        
    initialize: ->
        @resize()
        @scroll()
        
    render: ->
        # remove all the size classes and update a new one
        $('body').removeClass('kleine mittel grosse fixed free').addClass "#{ @size } #{ @fix }"
        
    resize: ->
        # detect width    
        width = $(@el).width()
        
        # see if width was changed
        if width isnt @width
        
            @width = width
        
            # set size
            if width < 1000
                @size = 'kleine'
            else if width > 1000 and width < 1400
                @size = 'mittel'
            else if width > 1400
                @size = 'grosse'
            
            # render
            @render()
            
    scroll: ->
        # detect scroll    
        scrollTop = $('body').scrollTop()
        
        if scrollTop < 60 and @fix is 'fixed'
            console.log 'ah'
            @fix = 'free'
            
            @render()
            
        else if scrollTop > 60 and @fix isnt 'fixed'
            console.log 'ah'
        
            @fix = 'fixed'
            
            @render()
        
        
$ ->
    container = new Container
    
        
