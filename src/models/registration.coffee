define [
    'underscore',
    'backbone'
], (_, Backbone) ->
    
    class Model extends Backbone.Model

        url: 'http://itswindtw.info:9001/api/users'

        initialize: ->

            @on 'error', (model, error) =>

                if error.status is 403
                    errorMessage = (JSON.parse error.responseText).errors

                    if _.contains errorMessage, 'Username has already been taken'
                        @trigger 'error', @, 'username taken'
                    if _.contains errorMessage, 'Email has already been taken'
                        @trigger 'error', @, 'email taken'
                    if _.contains errorMessage, 'Username is too long (maximum is 20 characters)'
                        @trigger 'error', @, 'username too lone'


        defaults:
            username: undefined
            email: undefined
            password: undefined
            passwordConfirmation: 'fuck you'

        validate: (user) ->

            if user.username.length < 3
                return "username too short"
            if user.username.length > 20
                return "username too long"
            if user.password isnt user.passwordConfirmation
                return "password confirmation mismatched"
            if user.password.length < 6
                return "password too short"




        parse: (result) ->

            # console.log 'success'
            # console.log result
            @trigger 'success', @
            # console.log result
            # if result.success
            # else
            #     if _.contains result.errors, 'Username has already been taken'
            #         @trigger 'error', @, 'username taken'
            #     if _.contains result.errors, 'Email has already been taken'
            #         @trigger 'error', @, 'email taken'
