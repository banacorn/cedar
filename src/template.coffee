define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/breadcrumb.html'
    'text!../templates/project.html'
    'text!../templates/locale.html'
    'text!../templates/file.html'
], (hogan, home, breadcrumb, project, locale, file) ->

    home        : hogan.compile home
    breadcrumb  : hogan.compile breadcrumb
    project     : hogan.compile project
    locale      : hogan.compile locale
    file		: hogan.compile file
