define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/project.html'
    'text!../templates/projectbreadcrumb.html'
    'text!../templates/filebrowser.html'
    'text!../templates/locale.html'
    'text!../templates/account.html'
    'text!../templates/signinbox.html'
    'text!../templates/entries.html'
], (hogan, home, project, projectBreadcrumb, fileBrowser, locale, account, signinbox, entries) ->

    home        : hogan.compile home
    project     : hogan.compile project
    projectBreadcrumb     : hogan.compile projectBreadcrumb
    filebrowser : hogan.compile fileBrowser
    locale      : hogan.compile locale
    entries     : hogan.compile entries


    account     : hogan.compile account
    signinbox   : hogan.compile signinbox
