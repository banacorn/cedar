require.config
    paths:
        jquery      : 'jam/jquery/jquery'
        underscore  : 'jam/underscore/underscore'
        backbone    : 'jam/backbone/backbone'
        hogan       : 'jam/hogan/hogan'        
        router      : 'router'
        template    : 'template'
require [
    'router',
    'skull',
    'views/account',
    'views/home',
    'jquery',
    'backbone'
], (Router, Skull, ViewAccount, ViewHome, $, Backbone) ->

    # some Backbone tweaks
    Skull


    class App extends Backbone.View
    
        el: 'body'

        render: ->
            account = new ViewAccount
            @assign account, '#account'
            $('#account').hide().fadeIn(200)

    
    
    $ ->
              
                    
        app = new App        
        app.render()            
        


        # setTimeout ->
        #     $('.hero').click ->
        #         $.ajax({
        #             type: 'POST',
        #             url: "http://itswindtw.info:9001/api/entries/1/translations",
        #             data: JSON.stringify({ translation: {msgstr: "XDDDD"}}),
        #             contentType: 'application/json; charset=utf-8',
        #             xhrFields: {
        #                 withCredentials: true
        #             }
        #         }).complete (xhr) ->
        #             console.log(xhr.responseText);
                
            
        # , 0

        Router.on 'route:home', ->
        
            
            home = new ViewHome
            home.render()
            
        # disable form:submit
        $('form').live 'submit', -> false

        # disable a:click
        $('a').live 'click', (e) ->
            Router.navigate $(@).attr('href'), true
            return false
            
            
        Backbone.history.start
            pushState: true
