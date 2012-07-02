fs              = require 'fs'
{exec, spawn}   = require 'child_process'
baker           = require 'baker'

baker.open 'gedit', [
    'src/sass/style.sass'
    'src/main.coffee'
    'index.html'    
]

baker.watch '.coffee', ['src/collections'], (source) -> "coffee -o scripts/collections #{ source }"
baker.watch '.coffee', ['src/views'], (source) -> "coffee -o scripts/views #{ source }"
baker.watch '.coffee', ['src/models'], (source) -> "coffee -o scripts/models #{ source }"
baker.watch '.coffee', ['src/main.coffee', 'src/router.coffee'], (source) -> "coffee -o scripts #{ source }"
baker.watch '.sass', ['src/sass'], (source) -> "compass compile"

option '-l', '--list', 'list all target liles'

        
task 'open', 'open files', (options) ->
    if options.list
        baker.listOpen()
    else
        baker.execOpen()
        

task 'watch', 'watch and build everything', (options) ->
    if options.list
        baker.listWatch()
    else
        baker.execWatch()
