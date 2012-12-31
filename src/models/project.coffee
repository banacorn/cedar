define [
    'collections/project/locale',
    'backbone'
], (CollectionProjectLocale, Backbone) ->
    
    class Model extends Backbone.Model
        defaults:
            name: 'anonymous'
            info: 'no info'
            file_type: 0
            locale: 'zh_TW'
            tags: []

        explore: ->

            console.log 'project explore'

            localeID = 1    # assume we know that


            ####################
            #   Locales
            ####################

            projectLocales = new CollectionProjectLocale
            projectLocales.id = @id
            projectLocales.snatch =>
                console.log projectLocales.toJSON()

            # tree
            console.log @toJSON()

