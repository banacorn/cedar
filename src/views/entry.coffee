define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->

    class Entry extends Backbone.Model
        defaults:
            expand: false
        toggle: ->
            @set 'expand', not @get('expand')

    class EntryView extends Backbone.View

        events: 
            'click .entry-chevron': 'toggle'

        initialize: ->
            @template = template.entry
            @status = new Entry
            @status.on 'change:expand', (model, expanded) =>
                if expanded
                    @$el.addClass 'expand'
                else
                    @$el.removeClass 'expand'


        toggle: -> 
            console.log @model.toJSON()
            @status.toggle()

        render: ->
            model = @model.toJSON()
            @$el.html @template.render
                translation: model.translation
                context: model.context
                id: model.id
                flag: model.flag?.toString()
                msgctxt:  model.msgctxt?.toString()
                msgid: model.msgid?.toString()
                msgid_plural: model.msgid_plural?.toString()
                msgstr:  model.msgstr?.toString()
                created_at: model.created_at
                updated_at: model.updated_at
                extracted_comments: model.extracted_comments



    class EntryList extends Backbone.View
        
        initialize: ->
            @collection.on 'reset', => @render()
            

            @template = template.entrylist

        render: ->
            entries = @collection.toJSON().map (entry) ->
                entry.context = entry.msgid[0][1..-2]
                entry.translation = entry.msgstr[0][1..-2]
                entry

            @$el.html @template.render
                entries: entries

            entries.forEach (entry) =>
                model = new Entry entry
                view = new EntryView
                    model: model
                @assign view, "#entry-#{ entry.id }"

