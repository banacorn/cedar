define [
    'models/registration',
    'jquery',
    'backbone',
    'template'
], (ModelRegistration, $, Backbone, $$) ->

    class View extends Backbone.View
        

        el: $('#main')

        events: 
            'submit #form': 'submit'
        

        initialize: ->        

            @template = $$.registration



    
        render: ->
            @$el.html @template.render()

            $('#username').val('banana')
            $('#email').val('baba@asdf.com')
            $('#password').val('aaaaaa')
            $('#password-confirmation').val('aaaaaa')

            return @

        submit: ->


            @resetError()

            @model = new ModelRegistration
                username: $('#username').val()
                email: $('#email').val()
                password: $('#password').val()
                passwordConfirmation: $('#password-confirmation').val()

            @model.on 'error', (model, error) =>
                switch error
                    when 'password confirmation mismatched' then @errorPasswordMismatched()
                    when 'password too short' then @errorPasswordTooShort()
                    when 'username too short' then @errorUsernameTooShort()
                    when 'username taken' then @errorUsernameTaken()
                    when 'email taken' then @errorEmailTaken()

            @model.on 'success', =>
                console.log 'success'

                

            @model.save()

        pending: ->
            $('#submit').text('...')


        resetError: ->
            $('#form input').removeClass('invalid').next().empty();


        errorPasswordMismatched: ->
            $('#password').addClass('invalid')
            $('#password-confirmation').addClass('invalid').next().text('與前組密碼不同')


        errorPasswordTooShort: ->
            $('#password').addClass('invalid').next().text('密碼需長於六個字')

        errorUsernameTooShort: ->
            $('#username').addClass('invalid').next().text('帳號需長於三個字')

        errorUsernameTaken: ->
            $('#username').addClass('invalid').next().text('帳號名稱已被使用')

        errorEmailTaken: ->
            $('#email').addClass('invalid').next().text('信箱已被使用')



