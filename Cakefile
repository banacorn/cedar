fs              = require 'fs'
{exec, spawn}   = require 'child_process'
baker           = require 'baker'

baker.watch '.sass', ['src/sass'], (source) -> "compass compile"

option '-l', '--list', 'list all target liles'

        
task 'open', 'open files', (options) ->
    if options.list
        baker.listOpen()
    else
        baker.execOpen()
        
