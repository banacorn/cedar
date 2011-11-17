$ ->

    viewport.init()

    socket = io.connect()
    socket.on 'ls', (data) ->
        console.log data
        
        
        
viewport = ( ->

    width = 0

    resizeMain = ->
        $('#main').width(width - 200)
        
    onResize = (cb) ->
        $(window).resize( ->
            cb()
        ).resize()

    public =
        init: ->
            onResize ->                    
                width = $(@).width()
                resizeMain()
            
)()
