define [
    'models/account',
    'jquery',
    'backbone',
    'template'
], (ModelAccount, $, Backbone, $$) ->

    
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
            Backbone.account.signin $('#signin-username').val(), $('#signin-password').val()
            


        resume: ->
            @remove()

        click: -> false

        render: ->
            @$el.html(@template.render()).hide().fadeIn(200);
            
            setTimeout -> 
                $('#signin-username').focus()
            , 0


            return @
        


    class Account extends Backbone.View

        initialize: ->

            @listenTo Backbone.account, 'change', @render

            @template = $$.account
            
            @box = new Box
                model: @account

            Backbone.account.on 'change:success', (model, success) =>
                if success
                    @box.resume()

        render: ->
            @$el.html @template.render
                authorized: Backbone.account.get 'authorized'
                username: Backbone.account.get 'username'

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

            if not Backbone.account.get 'authorized'
                $('#main').append('<div id="slot"></div>')
                @assign @box, '#slot'

        signout: ->
            if Backbone.account.get 'authorized'
                Backbone.account.signout()
                @mouseout()


    Backbone.account = new ModelAccount
    Backbone.account.authorize()
    return Account

    
