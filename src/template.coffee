define [
    'hogan'
    'text!../templates/home.html'
    'text!../templates/project/list.html'
], (Hogan, Home, ProjectList) ->
    home: Hogan.compile Home
    projectList: Hogan.compile ProjectList