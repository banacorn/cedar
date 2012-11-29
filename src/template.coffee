require [
    'hogan'
    'text!../templates/account.html'
    'text!../templates/api.html'
    'text!../templates/entry.html'
    'text!../templates/entrylist.html'
    'text!../templates/filebrowser.html'
    'text!../templates/home.html'
    'text!../templates/locale.html'
    'text!../templates/notfound.html'
    'text!../templates/project.html'
    'text!../templates/projectbreadcrumb.html'
    'text!../templates/projectlist.html'
    'text!../templates/signinbox.html'
], (Hogan, Account, Api, Entry, Entrylist, Filebrowser, Home, Locale, Notfound, Project, Projectbreadcrumb, Projectlist, Signinbox) ->
    account: Hogan.compile Account
    api: Hogan.compile Api
    entry: Hogan.compile Entry
    entrylist: Hogan.compile Entrylist
    filebrowser: Hogan.compile Filebrowser
    home: Hogan.compile Home
    locale: Hogan.compile Locale
    notfound: Hogan.compile Notfound
    project: Hogan.compile Project
    projectbreadcrumb: Hogan.compile Projectbreadcrumb
    projectlist: Hogan.compile Projectlist
    signinbox: Hogan.compile Signinbox