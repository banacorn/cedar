define ['jquery', 'backbone'], ($, Backbone) ->
    class Container extends Backbone.View
        el: window
        
        events:
            'resize': 'resize'
            
        initialize: ->
            @resize()
            
        render: ->
            # remove all the size classes and update a new one
            $('body').removeClass('kleine grosse').addClass "#{ @size }"
            
        resize: ->
            # detect width    
            width = $(@el).width()
            
            # see if width was changed
            if width isnt @width
            
                @width = width
            
                # set size
                if width < 1400
                    @size = 'kleine'
                else if width > 1400
                    @size = 'grosse'
                
                # render
                @render()
