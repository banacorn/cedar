define [
    'jquery'
    'underscore'
    'backbone'
    'template'
    'router'
    'model'
], ($, _, Backbone, template, router, model) ->

    class Breadcrumb extends Backbone.View
        
        el: $ window
        
        $breadcrumb: $ '#breadcrumb-container'
        
        
        events:
            'scroll': 'scroll'
    
        initialize: ->
        
    
        scroll: ->
            scrollTop =  @$el.scrollTop()
            console.log @model.get 'active'
            if scrollTop > 60 && @model.get 'active'
                $('#breadcrumb-container').addClass 'fixed'
                $('#main-container').addClass 'fixed'
            else
                $('#breadcrumb-container').removeClass 'fixed'
                $('#main-container').removeClass 'fixed'
                
                
        initialize: ->        
                     
            @template = template.breadcrumb
            @model = new model.Breadcrumb
        
            ###router.on 'route:home', =>
                        
                @$breadcrumb.html @template.render
                    breadcrumb: false
                    paths: @model.home()
            ###        
                    
            router.on 'route:project', (name) =>
                @model.set 'active'
                @$breadcrumb.html @template.render
                    breadcrumb: false
                    paths: @model.project name
            ###
            ###
