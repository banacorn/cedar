define ['jquery', 'underscore', 'backbone'
    'template'
    'model'
], ($, _, Backbone, template, model) ->


    class Box extends Backbone.View

        events:
            'click': 'resume'
            'click #login-box': 'click'

        initialize: ->
            @template = template.login

        resume: ->
            console.log 'resume'

            @remove()

        click: -> false

        render: ->
            console.log @el
            @$el.html @template.render()

            return @
        


    class Login extends Backbone.View

        el: $('#login')

        initialize: ->

            @template = template.login

        events:
            'click': 'login'

        login: ->
            @box = new Box
            $('#main').append('<div id="slot"></div>')
            @assign @box, '#slot'

    return Login