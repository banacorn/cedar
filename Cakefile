fs              = require 'fs'
{exec, spawn}   = require 'child_process'
baker           = require 'baker'
requirejs       = require 'requirejs'

baker.open 'gedit', [
    'src/sass/style.sass'
    'src/main.coffee'
    'index.html'    
]

buildConfig =
    baseUrl: 'scripts'
    out: 'scripts/main.js'
    name: 'main'
    paths:
        jquery: 'jam/jquery/jquery'
        underscore: 'jam/underscore/underscore'
        backbone: 'jam/backbone/backbone'
        hogan: 'jam/hogan/hogan'

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
        
task 'build', 'build everything', (options) ->
    console.log 'i like banana'



    requirejs.optimize buildConfig




task 'watch', 'watch and build everything', (options) ->
    if options.list
        baker.listWatch()
    else
        baker.execWatch()
