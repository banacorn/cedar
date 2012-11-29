define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->
    
        

    class ProjectBreadcrumb extends Backbone.View
        

        tagName: 'ol'

        initialize: ->
            @model.on 'change', => @render()

        render: ->
            @template = $$.projectBreadcrumb

            @$el.html @template.render
                projectName : @model.get 'projectName'
                crumbs      : @model.get 'crumbs'

            return @