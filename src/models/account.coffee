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

        authorize: (callback) ->

            @snatch => 

                authorized = @.get 'authorized'

                if authorized # success
                    Backbone.trigger 'authorize', true
                    @set 'authorized', true
                else # failed to authorize
                    Backbone.trigger 'authorize', false
                    @set 'authorized', false
            ,
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
                    console.log 'success'
                    @set 'authorized', true
                    Backbone.trigger 'authorize', true

                error: =>
                    @set 'authorized', false
                    Backbone.trigger 'authorize', false

        signout: ->
            @fetch
                url: 'http://itswindtw.info:9001/api/users/sign_out'
                type: 'DELETE'
                xhrFields: 
                    withCredentials: true
                # contentType: 'application/json; charset=utf-8'
                success: =>
                    @set 'authorized', false
                    Backbone.trigger 'authorize', false

                error: =>
                    @set 'authorized', false
                    Backbone.trigger 'authorize', false


