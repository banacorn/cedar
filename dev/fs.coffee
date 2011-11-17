util = require 'util'
exec = require('child_process').exec


ls = (path, cb) ->
    exec 'ls ' + path, cb
    
    
module.exports = 
    ls: ls



