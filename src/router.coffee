define [
    'init',
    'views/home',
    'views/project/list',
    'views/registration',
    'jquery',
    'backbone'
], (Init, ViewHome, ViewProjectList, ViewRegistration, $, Backbone) ->

    Init


    class Router extends Backbone.Router

        routes:
            ''              : 'home'
            'registration'  : 'registration'
            'project'       : 'projectList'

        initialize: ->

            # remove the class 'container' if the page is "wide"
            # @on 'all', (path) ->
            #     if /^route:home$/.test path
            #         $('#main').removeClass 'container'
            #     else
            #         $('#main').addClass 'container'
        home: ->
            homeView = new ViewHome
            $('#main').html homeView.el


        registration: ->
            registrationView = new ViewRegistration
            $('#main').html registrationView.el

        projectList: ->
            projectListView = new ViewProjectList
            $('#main').html projectListView.el


    return new Router