define ['jquery', 'underscore', 'backbone', 'hogan', 'template', 'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
    

    class ProjectBreadcrumb extends Backbone.View
    	

    	tagName: 'ol'

    	initialize: ->
    		@collection.on 'reset', => @render()

    	render: ->
    		@template = template.filebrowser
    		@$el.html @template.render
    			files: @collection.children()
    			root: @collection.root()
    			projectName: @collection.name
    		console.log @collection.children()
    		return @