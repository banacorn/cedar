define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template = template.project
            @projectList    = new MODEL.Projects
            @fileTree       = new MODEL.FileTree

        render: (name, path) ->

            @projectList.snatch =>
                project = @projectList.where({name: name})[0]



                # set filetree's id
                @fileTree.id = project.id

                @fileTree.snatch =>
                    path ?= ''
                    path = path.replace /\/$/, ''

                    if path and path.length isnt 0
                        path += '/'
                    else
                        path = ''

                    match = path.match(/\//ig)
                    match ?= []
                    level = match.length

                    fileTree = @fileTree.where({ level: level }).map (model) -> model.toJSON()
                    
                    root = _.compact path.split('/')
                    roots = ['']
                    for pathseg in root
                        roots.push _.last(roots) + pathseg + '/'
                    roots = _.tail roots
                    roots = _(roots).map (e, i) -> 
                        { segment: e, pathname: root[i] }




                    @$el.html @template.render
                        projectName : project.get 'name'
                        projectInfo : project.get 'info'
                        id          : project.id
                        files       : fileTree
                        roots       : roots



            return @
    
    
