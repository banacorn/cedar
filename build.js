var requirejs = require('requirejs');

var config = {
    baseUrl: 'scripts',
    out: 'scripts/release.js',
    name: 'main',
    paths: {
        jquery: 'jam/jquery/jquery',
        underscore: 'jam/underscore/underscore',
        backbone: 'jam/backbone/backbone',
        hogan: 'jam/hogan/hogan'
    }
};


requirejs.optimize(config);

