define ['jquery', 'underscore', 'backbone', 'hogan'
    'text!../../templates/project.html'
], ($, _, Backbone, hogan, template) ->

    class Project extends Backbone.View
    
        load: ->
            $('#main').html template
    
    
    
    
    
