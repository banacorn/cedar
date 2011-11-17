io  = require('./server').io
fs  = require './fs'

PATH = '~/node'

io.sockets.on 'connection', (socket) ->
    fs.ls PATH, (error, stdout)->
          socket.emit 'ls', stdout
