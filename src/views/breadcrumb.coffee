define [
    'jquery'
    'underscore'
    'backbone'
    'template'
    'router'
    'model'
], ($, _, Backbone, template, router, model) ->

    class Breadcrumb extends Backbone.View
        
        el: $('#breadcrumb')
        
        initialize: ->        
                     
            @template = template.breadcrumb
            @model = new model.Breadcrumb
        
            router.on 'route:home', =>
                        
                @$el.html @template.render
                    paths: @model.home()
                    
                    
            router.on 'route:project', (name) =>
            
                @$el.html @template.render
                    paths: @model.project name
