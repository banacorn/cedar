{file} = require '../file'
   
            
        
static = (req, res) ->
    res.sendfile "lib/public#{ req.url }"

get = (req, res) ->
    unless req.xhr
        res.sendfile "lib/public/index.html"
    else
        console.log file[req.url]
        res.json file[req.url]
        
put = (req, res) ->
    unless req.xhr
        res.sendfile "lib/public/index.html"
    else
        console.log 'XHR'
        res.json file

exports.static = static
exports.get = get
exports.put = put

