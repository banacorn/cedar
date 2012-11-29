define [
    'underscore',
    'backbone'
], (_, Backbone) ->
    
    class Model extends Backbone.Model
        
        defaults: 
            crumbs: []
            projectName: 'anonProject'

        path: (path) ->
            segments = _.compact path.split '/'
            inits = ['']
            for segment in segments
                inits.push _.last(inits) + segment + '/'
            inits = _.tail inits
            inits = _(inits).map (e, i) -> 
                { segment: e, pathname: segments[i] }

            @set 'crumbs', inits