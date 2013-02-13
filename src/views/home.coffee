define [
    'jquery',
    'backbone',
    'template'
], ($, Backbone, $$) ->

    class Home extends Backbone.View
        tagName: 'article'
        id: 'home'
        template: $$.home
        initialize: -> @render()
        render: -> 
            @$el.html @template.render()
            return @
