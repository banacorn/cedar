#### Module Dependencies ####
fs              = require 'fs'
{exec, spawn}   = require 'child_process'
baker           = require 'baker'

#### Baker ####

# open all files in src/ with gedit
baker.open 'gedit', [
    'src'                       # server
    '!src/public/src'       
    'lib/public/index.html'     
]


baker.watch '.coffee', ['src', '!src/public', '!src/routes'], (source) -> "coffee -o lib #{ source }"
baker.watch '.coffee', ['src/routes'], (source) -> "coffee -o lib/routes #{ source }"
baker.watch '.coffee', ['src/public'], (source) -> "coffee -o lib/public/scripts #{ source }"
baker.watch '.styl', ['src/public/style.styl'], (source) -> "stylus -c -o lib/public/stylesheets #{ source }"

option '-l', '--list', 'list all target liles'

#### Tasks ####
        
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
