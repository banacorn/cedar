define [
    'models/entry',
    'jquery',
    'backbone',
    'template'
], (ModelEntry, $, Backbone, $$) ->

    class EntryView extends Backbone.View

        # events: 
            # 'click .entry-chevron': 'toggle'

        initialize: ->
            @template = $$.entry
            @status = new ModelEntry
            # @status.on 'change:expand', (model, expanded) =>
            #     if expanded
            #         @$el.addClass 'expand'
            #     else
            #         @$el.removeClass 'expand'


        # toggle: -> 
            # console.log @model.toJSON()
            # @status.toggle()

        render: ->
            model = @model.toJSON()
            @$el.html @template.render
                translation: model.translation
                context: model.context
                # id: model.id
                # flag: model.flag?.toString()
                # msgctxt:  model.msgctxt?.toString()
                # msgid: model.msgid?.toString()
                # msgid_plural: model.msgid_plural?.toString()
                # msgstr:  model.msgstr?.toString()
                # created_at: model.created_at
                # updated_at: model.updated_at
                # extracted_comments: model.extracted_comments



    class EntryList extends Backbone.View
        
        initialize: ->
            @collection.on 'reset', => @render()
            

            @template = $$.entrylist

        render: ->
            entries = @collection.toJSON().map (entry) ->
                entry.context = entry.msgid[0][1..-2]
                entry.translation = entry.msgstr[0][1..-2]
                return entry

            @$el.html @template.render
                entries: entries

            entries.forEach (entry) =>
                model = new ModelEntry entry
                view = new EntryView
                    model: model
                @assign view, "#entry-#{ entry.id }"

