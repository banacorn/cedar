define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class HomePage extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.home
            @ProjectList = new model.ProjectList

            
    
        render: ->

            @ProjectList.snatch =>  
                @$el.html @template.render
                    projects: @ProjectList.toJSON()


    
            return @
