define [
    'models/registration',
    'jquery',
    'backbone',
    'template'
], (ModelRegistration, $, Backbone, $$) ->

    class Home extends Backbone.View
        tagName: 'article'
        id: 'home'
        template: $$.home
        initialize: -> 
            @render()
        render: -> 
            @$el.html @template.render()
            return @

        events:
            'submit #registration': 'submit'

        submit: ->


            # @resetError()

            registrationModel = new ModelRegistration
                username: $('#inputUsername').val()
                email: $('#inputEmail').val()
                password: $('#inputPassword').val()
                passwordConfirmation: $('#inputPasswordConfirmation').val()

            registrationModel.on 'error', (model, error) =>
                console.log error
                # switch error
                #     when 'password confirmation mismatched' then @errorPasswordMismatched()
                #     when 'password too short' then @errorPasswordTooShort()
                #     when 'username too short' then @errorUsernameTooShort()
                #     when 'username too long' then @errorUsernameTooLong()
                #     when 'username taken' then @errorUsernameTaken()
                #     when 'email taken' then @errorEmailTaken()

            registrationModel.on 'success', =>
                console.log 'success'

                

            registrationModel.save()

            return false