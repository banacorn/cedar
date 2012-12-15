define [
    'underscore',
    'backbone'
], (_, Backbone) ->
    
    class Model extends Backbone.Model
        url: 'http://itswindtw.info:9001/api/users/sign_in'

        defaults:
            'authorized': false
            'username': undefined
            'password': undefined

        parse: (data) ->
            if data?
                @trigger 'authorized'
                if data.user?
                    _.extend data, data.user
                    delete data.user
            return data

        authorize: ->


            @fetch
                xhrFields: 
                    withCredentials: true
                error: =>
                    @set 'authorized', false

        signin: (username, password) ->
            @fetch
                data: JSON.stringify
                    user:
                        login: username
                        password: password
                        remember_me: 0
                type: 'POST'
                xhrFields: 
                    withCredentials: true
                contentType: 'application/json; charset=utf-8'
                success: =>
                    @set 'authorized', true

        signout: ->
            @fetch
                url: 'http://itswindtw.info:9001/api/users/sign_out'
                type: 'DELETE'
                xhrFields: 
                    withCredentials: true
                # contentType: 'application/json; charset=utf-8'
                success: =>
                    @set 'authorized', false
                error: =>
                    @set 'authorized', false

