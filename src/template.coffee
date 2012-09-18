define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/project.html'
    'text!../templates/projectlist.html'
    'text!../templates/projectbreadcrumb.html'
    'text!../templates/filebrowser.html'
    'text!../templates/locale.html'
    'text!../templates/account.html'
    'text!../templates/signinbox.html'
    'text!../templates/entry.html'
    'text!../templates/entrylist.html'
    'text!../templates/api.html'
    'text!../templates/notfound.html'
], (hogan, home, project, projectlist, projectBreadcrumb, fileBrowser, locale, account, signinbox, entry, entrylist, api, notfound) ->

    home        : hogan.compile home
    project     : hogan.compile project
    projectList : hogan.compile projectlist
    projectBreadcrumb     : hogan.compile projectBreadcrumb
    filebrowser : hogan.compile fileBrowser
    locale      : hogan.compile locale

    entry       : hogan.compile entry
    entrylist   : hogan.compile entrylist


    account     : hogan.compile account
    signinbox   : hogan.compile signinbox

    api         : hogan.compile api
    notfound    : hogan.compile notfound
