define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/layout.html'
    'text!../templates/project/list.html'
    'text!../templates/project/listitem.html'
], (Hogan, Home, Layout, ProjectList, ProjectListitem) ->
    home: Hogan.compile Home
    layout: Hogan.compile Layout
    projectList: Hogan.compile ProjectList
    projectListitem: Hogan.compile ProjectListitem