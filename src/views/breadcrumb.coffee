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
                        
                @$el.fadeOut(100).hide().html(@template.render
                    paths: @model.home()
                ).fadeIn 500
        
            router.on 'route:prodject', (name) =>
            
            
                @$el.fadeOut(100).hide().html(@template.render
                    paths: @model.project(name)
                ).fadeIn 500
