define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class View extends Backbone.View
        
    
        render: (id, files) ->
            template = $$.stat

            setTimeout ->
                $("#stat-#{id}").html template.render
                    files: files 
            , 0

            return @
