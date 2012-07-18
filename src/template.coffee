define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/breadcrumb.html'
    'text!../templates/project.html'
    'text!../templates/locale.html'
], (hogan, home, breadcrumb, project, locale) ->

    home        : hogan.compile home
    breadcrumb  : hogan.compile breadcrumb
    project     : hogan.compile project
    locale      : hogan.compile locale
