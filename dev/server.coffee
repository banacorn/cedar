express = require 'express' 
server  = express.createServer()
io      = require('socket.io').listen server

server.configure ->
    server.use express.static(__dirname + '/public')

server.configure 'development', ->
    server.use express.errorHandler(
        dumpExceptions: true
        showStack: true
    )

server.configure 'production', ->
    server.use express.errorHandler()

    
server.listen 4000
console.log 'Express server listening on port %d in %s mode', 4000, server.settings.env


module.exports = 
    server: server
    io: io
