define ['jquery', 'underscore', 'backbone', 'hogan', 'router'], ($, _, Backbone, hogan, router) ->



    class Breadcrumb extends Backbone.View
        
        initialize: ->
        
        
            router.on 'route:projectList', ->
                console.log 'fuck'
        
            router.on 'route:project', (id) ->
                console.log 'fuck', id
        
        
        
            router.on 'route:anything', ->
                console.log 'not found'
