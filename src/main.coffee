require.config
    paths:
        jquery: 'lib/jquery-1.7.1.min'
        underscore: 'lib/underscore-min'
        backbone: 'lib/backbone-amd-min'


require ['jquery', 'underscore', 'backbone', 'view/container'], ($, _, Backbone, Container) ->
    
    
    project = do ->
        class Model extends Backbone.Model
            
        class Collection extends Backbone.Collection
            model: Model
    
        public = 
            collection: new Collection
    
    
    
    
    
    
    
    
    
                
    class Router extends Backbone.Router
        routes:
            '!/projects/:id/*path': 'project'
            '!/projects/:id': 'project'
            '!/projects': 'project'
            
        initialize: (@api) ->
            @navigate '!/projects'
            
        project: (id, path) ->
            console.log "id #{id}"
            console.log "path #{path}"
            
            console.log project.get
            
                
    $ ->
        container = new Container 
        router = new Router '106.187.39.21:8000'
        
        Backbone.history.start()
        
