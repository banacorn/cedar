define [
    'backbone'
], (Backbone) ->
    
    class Model extends Backbone.Model
        url: 'http://itswindtw.info:9001/api/users/sign_in'

