define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/breadcrumb.html'
    'text!../templates/project.html'
    'text!../templates/projectbreadcrumb.html'
    'text!../templates/filebrowser.html'
    'text!../templates/locale.html'
    'text!../templates/login.html'
], (hogan, home, breadcrumb, project, projectBreadcrumb, locale, login) ->

    home        : hogan.compile home
    breadcrumb  : hogan.compile breadcrumb
    project     : hogan.compile project
    projectBreadcrumb     : hogan.compile projectBreadcrumb
    filebrowser : hogan.compile filebrowser
    locale      : hogan.compile locale
    login		: hogan.compile login
