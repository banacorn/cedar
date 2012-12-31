define [
    'models/locale',
    'backbone'
], (ModelLocale, Backbone) ->
    
    class Collection extends Backbone.Collection

        model: ModelLocale

        url: "/api/locales"
