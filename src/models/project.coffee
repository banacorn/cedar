define [
    'backbone'
], (Backbone) ->

    class Project extends Backbone.Model
        url: -> "/api/projects/#{ @id }"