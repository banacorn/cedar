define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Registration extends Backbone.View
        tagName: 'article'
        id: 'registration'
        template: $$.registration
        initialize: -> @render()
        render: -> 
            @$el.html @template.render()
            return @
