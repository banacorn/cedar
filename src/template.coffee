define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/breadcrumb.html'
    'text!../templates/project.html'
    'text!../templates/locale.html'
    'text!../templates/login.html'
], (hogan, home, breadcrumb, project, locale, login) ->

    home        : hogan.compile home
    breadcrumb  : hogan.compile breadcrumb
    project     : hogan.compile project
    locale      : hogan.compile locale
    login		: hogan.compile login
