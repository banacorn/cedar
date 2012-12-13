define [
    'hogan'
    'text!../templates/account.html'
    'text!../templates/api.html'
    'text!../templates/entry.html'
    'text!../templates/entrylist.html'
    'text!../templates/filebrowser.html'
    'text!../templates/home.html'
    'text!../templates/locale.html'
    'text!../templates/notfound.html'
    'text!../templates/project/breadcrumb.html'
    'text!../templates/project/list.html'
    'text!../templates/project.html'
    'text!../templates/registration.html'
    'text!../templates/signinbox.html'
], (Hogan, Account, Api, Entry, Entrylist, Filebrowser, Home, Locale, Notfound, ProjectBreadcrumb, ProjectList, Project, Registration, Signinbox) ->
    account: Hogan.compile Account
    api: Hogan.compile Api
    entry: Hogan.compile Entry
    entrylist: Hogan.compile Entrylist
    filebrowser: Hogan.compile Filebrowser
    home: Hogan.compile Home
    locale: Hogan.compile Locale
    notfound: Hogan.compile Notfound
    projectBreadcrumb: Hogan.compile ProjectBreadcrumb
    projectList: Hogan.compile ProjectList
    project: Hogan.compile Project
    registration: Hogan.compile Registration
    signinbox: Hogan.compile Signinbox