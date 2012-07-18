define ['underscore', 'backbone'], (_, Backbone) ->
    
    class Model extends Backbone.Model
    
        home: -> [
            {
                icon: 'icon-home'
                label: '首頁'
            }
        ]
        
        project: (name) -> 
            [
                {
                    icon: 'icon-book'
                    label: name
                }
            ]
