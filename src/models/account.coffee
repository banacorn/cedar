define [
    'underscore',
    'backbone'
], (_, Backbone) ->
    
    class Model extends Backbone.Model
        url: 'http://itswindtw.info:9001/api/users/sign_in'

        initialize: ->

        defaults:
            'authorized': false

        parse: (data) ->
            if data?
                @set 'authorized', true


                if data.user?
                    _.extend data, data.user
                    delete data.user

            else
                @set 'authorized', false
            return data

        authorize: ->
            @on 'sync', ->
                authorized = @get 'authorized'
                @set 'authorized', authorized

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
                    Backbone.trigger 'authorized'


                error: =>
                    @set 'authorized', false
                    Backbone.trigger 'authorization failed'


        signout: ->
            @fetch
                url: 'http://itswindtw.info:9001/api/users/sign_out'
                type: 'DELETE'
                xhrFields: 
                    withCredentials: true
                # contentType: 'application/json; charset=utf-8'
                success: =>
                    @set 'authorized', false
                    Backbone.trigger 'unauthorized'

                error: =>
                    @set 'authorized', false


