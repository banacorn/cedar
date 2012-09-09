define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class HomePage extends Backbone.View
        

        el: $('#main')
        
        initialize: ->        

            @template = template.home
            @projectCollection = new model.Projects
    
        render: ->


            @projectCollection.snatch =>  
                # console.log @projectCollection          
                @$el.html @template.render
                    projects: @projectCollection.toJSON()


    
            return @
