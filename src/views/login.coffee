define [
    'models/login',
    'jquery',
    'backbone',
    'template'
], (ModelLogin, $, Backbone, $$) ->

    class Box extends Backbone.View

        events:
            'click': 'resume'
            'click #login-box': 'click'
            'submit form': 'submit'
            'click button': 'submit'

        initialize: ->
            @template = $$.login

            @model.on 'change:success', (model, status) =>
                if status
                    @success()

        submit: ->

            @model.fetch
                data: JSON.stringify
                    user:
                        login: 'skuld'#$('#username').val()
                        password: '123456'#$('#password').val()
                        remember_me: 0
                type: 'POST'
                xhrFields: 
                    withCredentials: true
                contentType: 'application/json; charset=utf-8'

        success: ->
            @resume()


        resume: ->
            @remove()

        click: -> false

        render: ->
            @$el.html(@template.render()).hide().fadeIn(200);
            $('input', @$el)[0].focus()


            return @
        


    class Login extends Backbone.View

        el: $('#login')

        initialize: ->

            @account = new ModelLogin
            @account.on 'change:success', (model, success) =>
                if success
                    @renderLogout()


            @template = 
                login: $$.login
                logout: $$.logout




            setTimeout =>
                @login
            , 0

        events:
            'click': 'login'

        login: ->
            console.log 'asdf'
            @box = new Box
                model: @account

            $('#main').append('<div id="slot"></div>')
            @assign @box, '#slot'

        renderLogout: ->

            @$el.html @template.logout.render()





    return Login