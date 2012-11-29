define [
    'backbone'
], (Backbone) ->
    
    class Entry extends Backbone.Model
        defaults:
            expand: false
        toggle: ->
            @set 'expand', not @get('expand')