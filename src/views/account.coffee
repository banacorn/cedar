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
            @model.signin $('#signin-username').val(), $('#signin-password').val()
            


        resume: ->
            @remove()

        click: -> false

        render: ->
            @$el.html(@template.render()).hide().fadeIn(200);
            $('input', @$el)[0].focus()


            return @
        


    class Account extends Backbone.View

        initialize: ->

            @account = new ModelAccount
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