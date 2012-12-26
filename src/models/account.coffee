define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model
        url: 'http://itswindtw.info:9001/api/users/sign_in'

        initialize: ->

        defaults:
            'authorized': undefined

        parse: (data) ->
            if data?
                @set 'authorized', true
            else
                @set 'authorized', false
            return data

        authorize: (callback) ->

            if callback?
                authorized = Backbone.account.get 'authorized'

                if authorized?
                    callback authorized
                else
                    Backbone.once 'authorized', -> callback true
                    Backbone.once 'unauthorized', -> callback false


            @on 'sync', ->
                authorized = @get 'authorized'
                @set 'authorized', authorized
                Backbone.trigger 'authorized'

            @fetch
                xhrFields: 
                    withCredentials: true
                error: =>
                    @set 'authorized', false

        signin: (username, password) ->
            @fetch
                data: JSON.stringify
                    login: username
                    password: password
                    remember_me: 0
                type: 'POST'
                xhrFields: 
                    withCredentials: true
                contentType: 'application/json; charset=utf-8'
                success: =>
                    console.log arguments
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


