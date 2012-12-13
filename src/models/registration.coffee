define [
    'underscore',
    'backbone'
], (_, Backbone) ->
    
    class Model extends Backbone.Model

        url: 'http://itswindtw.info:9001/api/users'

        defaults:
            user:
                username: undefined
                email: undefined
                password: undefined
                passwordConfirmation: 'fuck you'

        validate: (attr) ->

            user = attr.user

            if user.username.length < 3
                return "username too short"
            if user.password isnt user.passwordConfirmation
                return "password confirmation mismatched"
            if user.password.length < 6
                return "password too short"




        parse: (result) ->
            if result.success
                console.log 'success'
                console.log result
                @trigger 'success', @
            else
                if _.contains result.errors, 'Username has already been taken'
                    @trigger 'error', @, 'username taken'
                if _.contains result.errors, 'Email has already been taken'
                    @trigger 'error', @, 'email taken'
