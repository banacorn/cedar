define [
    'jquery',
    'underscore',
    'backbone',
    'template'
], ($, _, Backbone, $$) ->

    class Model extends Backbone.Model
        url: 'http://itswindtw.info:9001/api/users/sign_in'

        defaults:
            'authorized': false

        parse: (data) ->
            if data?
                data.authorized = true
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


    class Box extends Backbone.View

        events:
            'click': 'resume'
            'click #signin-box': 'click'
            'submit form': 'submit'
            'click button': 'submit'

        initialize: ->
            @template = $$.signinbox

        render: ->
            @$el.html @template.render()

            return @

        submit: ->
            @model.signin $('#username').val(), $('#password').val()
            


        resume: ->
            @remove()

        click: -> false

        render: ->
            @$el.html(@template.render()).hide().fadeIn(200);
            $('input', @$el)[0].focus()


            return @
        


    class Account extends Backbone.View

        initialize: ->

            @account = new Model
            @account.authorize()


            @account.on 'change', =>
                @render()
            @template = $$.account
            
            @box = new Box
                model: @account
            @account.on 'change:success', (model, success) =>
                if success
                    @box.resume()

        render: ->
            @$el.html @template.render
                authorized: @account.get 'authorized'
                username: @account.get 'username'

            return @

        events:
            'click #account-panel'  : 'signin'
            'click #account-signout': 'signout'
            'mouseover'             : 'mouseover'
            'mouseout'              : 'mouseout'

        mouseover: ->
            @$el.addClass 'active'
        mouseout: ->
            @$el.removeClass 'active'


        signin: ->

            if not @account.get 'authorized'
                $('#main').append('<div id="slot"></div>')
                @assign @box, '#slot'

        signout: ->
            if @account.get 'authorized'
                @account.signout()
                @mouseout()






    return Account