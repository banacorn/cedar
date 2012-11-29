var fs = require('fs');
var exec = require('child_process').exec;
var pathModule = require('path');
require('underscore-injection');


var grabFiles = function (path, callback) {
    exec('cd ' + path + ' && find * -type f', function (error, stdout) {
        callback(stdout.trim().split('\n'));
    });
};

var watchFolders = function (path, callback) {
    exec('cd ' + path + ' && find * -type d', function (error, stdout) {
        
        folders = stdout.trim().split('\n');
        folders.forEach(function (folder) {
            foldername = pathModule.join(path, folder);

            fs.watch(foldername, callback);

        })
    });
}

var path = {
    views: 'src/views/',
    models: 'src/models/',
    collections: 'src/collections/'
};

var hub = {
    views: 'src/voir.coffee',
    models: 'src/model.coffee',
    collections: 'src/collection.coffee'
};




var generator = function (files, root) {

    var camel = function (path) {
        segments = path.split('/');
        return segments.map(function (segment) {
            return segment[0].toUpperCase() + segment.substr(1).replace('.coffee', '');
        }).join('');
    };

    var path = [
        'define [',
        files.map(function (file) { return "    '" + root + file.replace('.coffee', '') + "'"; }),
    ].flatten().join('\n');

    var cameled = files.map(camel);


    argument = '\n], (' + cameled.join(', ') + ') ->\n';

    body = cameled.map(function (file) { return "    " + file + ": " + file; }).join('\n');


    return path + argument + body;
};

// VIEW
grabFiles(path.views, function (files) {
    fs.writeFile(hub.views, generator(files, 'views/'));
});

watchFolders(path.views, function () {
    grabFiles(path.views, function (files) {
        fs.writeFile(hub.views, generator(files, 'views/'));
    });
});


// MODEL
grabFiles(path.models, function (files) {
    fs.writeFile(hub.models, generator(files, 'models/'));
});

watchFolders(path.models, function () {
    grabFiles(path.models, function (files) {
        fs.writeFile(hub.models, generator(files, 'models/'));
    });
});

// COLLECTION
grabFiles(path.collections, function (files) {
    fs.writeFile(hub.collections, generator(files, 'collections/'));
});

watchFolders(path.collections, function () {
    grabFiles(path.collections, function (files) {
        fs.writeFile(hub.collections, generator(files, 'collections/'));
    });
});