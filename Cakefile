fs              = require 'fs'
{exec, spawn}   = require 'child_process'
baker           = require 'baker'

baker.open 'gedit', [
    'src/style.sass'
    'src/main.coffee'
    'index.html'    
]



baker.watch '.coffee', ['src/view'], (source) -> "coffee -o scripts/view #{ source }"
baker.watch '.coffee', ['src', '!src/view'], (source) -> "coffee -o scripts #{ source }"
baker.watch '.sass', ['src'], (source) -> "compass compile"

option '-l', '--list', 'list all target liles'

        
task 'open', 'open files', (options) ->
    if options.list
        baker.listOpen()
    else
        baker.execOpen()
        
task 'build', 'build everything', (options) ->
    if options.list
        baker.listBuild()
    else
        baker.execBuild()
        
task 'watch', 'watch and build everything', (options) ->
    if options.list
        baker.listWatch()
    else
        baker.execWatch()
