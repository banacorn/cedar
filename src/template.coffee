define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/project.html'
    'text!../templates/projectbreadcrumb.html'
    'text!../templates/filebrowser.html'
    'text!../templates/locale.html'
    'text!../templates/login.html'
    'text!../templates/entries.html'
], (hogan, home, project, projectBreadcrumb, fileBrowser, locale, login, entries) ->

    home        : hogan.compile home
    project     : hogan.compile project
    projectBreadcrumb     : hogan.compile projectBreadcrumb
    filebrowser : hogan.compile fileBrowser
    locale      : hogan.compile locale
    login		: hogan.compile login
    entries     : hogan.compile entries
