define ['jquery', 'underscore', 'backbone', 'hogan', 'template', 'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
        

    class ProjectBreadcrumb extends Backbone.View
    	

    	tagName: 'ol'

    	initialize: ->
    		@model.on 'change', => @render()

    	render: ->
    		@template = template.projectBreadcrumb

    		@$el.html @template.render
    			projectName	: @model.get 'projectName'
    			crumbs		: @model.get 'crumbs'


    		console.log @$el

    		return @