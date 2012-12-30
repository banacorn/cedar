define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->
    
        

    class ProjectBreadcrumb extends Backbone.View
        
        events: 
            'click #button-list-ordering': 'eventListOrdering'
            'click #button-icon-ordering': 'eventIconOrdering'

        tagName: 'ol'

        initialize: ->
            @model.on 'change', => @render()
            @listenTo Backbone.settings, 'change:fileOrdering', @updateFileOrdering


        render: ->
            @template = $$.projectBreadcrumb

            @$el.html @template.render
                projectName : @model.get 'projectName'
                crumbs      : @model.get 'crumbs'
                listOrdering: (Backbone.settings.get 'fileOrdering') is 'list'
            return @

        eventListOrdering: ->
            Backbone.settings.set 'fileOrdering', 'list'


        eventIconOrdering: ->
            Backbone.settings.set 'fileOrdering', 'icon'

        updateFileOrdering: (_, setting) ->
            switch setting 
                when 'icon'
                    $('#button-icon-ordering').addClass('active')
                    $('#button-list-ordering').removeClass('active')

                when 'list'
                    $('#button-list-ordering').addClass('active')
                    $('#button-icon-ordering').removeClass('active')
