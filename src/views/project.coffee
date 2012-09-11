define ['jquery', 'underscore', 'backbone', 'hogan'
    'template'
    'model'
], ($, _, Backbone, hogan, template, MODEL) ->
    
        

    class Project extends Backbone.View
    
        el: $('#main')
    
        initialize: ->
            @template       = template.project
            @projectList    = new MODEL.ProjectList
            @fileTree       = new MODEL.FileTree
            @locales        = new MODEL.Locales


        render: (name, path) ->

            @projectList.snatch =>
                project = @projectList.where({name: name})[0]





                # set filetree's id
                @fileTree.id = project.id

                @fileTree.snatch =>
                    
                    #   level '' = 0
                    #   level 'a' = 1
                    #   level 'a/' = 1
                    #   level 'a/a' = 2

                    if path?
                        pathname = path.replace(/\/$/, '')
                    else
                        pathname = ''

                    level = _.compact(pathname.replace(/\/$/, '').split('/')).length

                    # get the nodes at some level
                    fileTree = @fileTree.where({ level: level }).map (model) -> model.toJSON()

                    # inits
                    segments = _.compact pathname.split '/'
                    inits = ['']
                    for segment in segments
                        inits.push _.last(inits) + segment + '/'
                    inits = _.tail inits
                    inits = _(inits).map (e, i) -> 
                        { segment: e, pathname: segments[i] }

                    if pathname isnt ''
                        root = pathname + '/'
                    else
                        root = ''

                    console.log fileTree

                    @$el.html @template.render
                        projectName : project.get 'name'
                        projectInfo : project.get 'info'
                        id          : project.id
                        files       : fileTree
                        crumbs      : inits
                        root        : root


                    @locales.id = project.id
                    @locales.snatch =>
                        #console.log @locales.toJSON()

            return @
    
    
