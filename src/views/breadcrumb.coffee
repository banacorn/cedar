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
            if scrollTop > 40 && @model.get 'active'
                $('#breadcrumb-container').addClass 'fixed'
                $('#main-container').addClass 'fixed'
            else
                $('#breadcrumb-container').removeClass 'fixed'
                $('#main-container').removeClass 'fixed'
                
                
        initialize: ->        
                     
            @template = template.breadcrumb
            @model = new model.Breadcrumb
        

            router.on 'route:project:home', (name) =>

                @model.set 'active', true
                @$breadcrumb.html @template.render
                    project: true
                    projectName: name
                    home: true


            router.on 'route:project:entry', (name) =>

                @model.set 'active', true
                @$breadcrumb.html @template.render
                    project: true
                    projectName: name
                    entry: true

            router.on 'route:project:user', (name) =>

                @model.set 'active', true
                @$breadcrumb.html @template.render
                    projectName: name
                    project: true
                    user: true

            router.on 'route:home', =>
                
                @model.set 'active', false
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
