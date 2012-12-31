define [
    'backbone'
], (Backbone) ->

    class Model extends Backbone.Collection
        url: -> "/api/project_locales/#{ @id }/po_files"





