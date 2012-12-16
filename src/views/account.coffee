define [
    'models/account',
    'jquery',
    'backbone',
    'template'
], (ModelAccount, $, Backbone, $$) ->

    
    class SignInBox extends Backbone.View

        events:
            'click': 'close'
            'click #signin-box': 'click'
            'submit form': 'submit'
            'focus input': 'focus'
            'click button': 'submit'
            'keydown': 'keydown'

        initialize: ->
            @template = $$.signinbox

            $('input').change -> console.log 'changed!!!'

        render: ->
            @$el.html @template.render()

            return @

        submit: ->
            Backbone.account.signin $('#signin-username').val(), $('#signin-password').val()
            $('#signin-button').text('驗證中 ...').addClass('pending')

        fail: ->
            $('#signin-username').addClass('invalid').focus()
            $('#signin-password').addClass('invalid')
            $('#signin-button').text('帳號密碼錯誤').removeClass('pending')
        
        close: ->
            @remove()

        click: -> false

        render: ->
            @$el.html(@template.render()).hide().fadeIn(200);
            
            setTimeout -> 
                $('#signin-username').focus()
            , 0


            return @

        focus: (event) -> 
            setTimeout ->
                event.target.select()
            , 0

        keydown: (event) ->
            if event.keyCode is 27 # ESC
                @close()

        


    class Account extends Backbone.View

        initialize: ->

            @listenTo Backbone.account, 'change', @render

            @template = $$.account
            
            @box = new SignInBox
                model: @account

            Backbone.on 'authorized', => @box.close()
            Backbone.on 'authorization failed', => @box.fail()



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

    
