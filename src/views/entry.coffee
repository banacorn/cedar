define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class View extends Backbone.View
        
        initialize: ->
            @collection.on 'reset', => @render()
            @template = template.entries

        render: ->
            entries = @collection.toJSON().map (entry) ->
                entry.context = entry.msgid[0][1..-2]
                entry.translation = entry.msgstr[0][1..-2]
                entry

            @$el.html @template.render
                entries: entries


