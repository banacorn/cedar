define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/breadcrumb.html'
    'text!../templates/project.html'
], (hogan, home, breadcrumb, project) ->

    home        : hogan.compile home
    breadcrumb  : hogan.compile breadcrumb
    project     : hogan.compile project
