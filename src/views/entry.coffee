define [
    'models/entry',
    'jquery',
    'backbone',
    'template'
], (ModelEntry, $, Backbone, $$) ->

    class EntryView extends Backbone.View

        events: 
            'click .entry-translation': 'edit'
            'blur .entry-input input': 'blur'
            'submit .entry-input form': 'submit'

        submit: ->
            val = $('.entry-input input', @el).val()
            console.log 'submit', val
            $('.entry-translation', @el).text(val)
            @blur()
            false

        edit: ->
            $('.entry-translation', @el).hide()
            $('.entry-input', @el).show()

            setTimeout ->
                $('.entry-input input', @el).focus().select()
            , 0

        blur: ->
            $('.entry-translation', @el).show()
            $('.entry-input', @el).hide()


            # $('<input type="text" class=".entry-input">').appendTo(@$el)

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
                urn: Backbone.history.fragment
                translation: model.translation
                context: model.context
                id: model.id
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

