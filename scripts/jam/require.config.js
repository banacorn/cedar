var jam = {
    "packages": [
        {
            "name": "underscore",
            "location": "jam/underscore",
            "main": "underscore.js"
        },
        {
            "name": "backbone",
            "location": "jam/backbone",
            "main": "backbone.js"
        },
        {
            "name": "hogan",
            "location": "jam/hogan",
            "main": "hogan.js"
        },
        {
            "name": "jquery",
            "location": "jam/jquery",
            "main": "jquery.js"
        }
    ],
    "version": "0.1.11",
    "shim": {
        "hogan": {
            "exports": "hogan"
        }
    }
};

if (typeof require !== "undefined" && require.config) {
    require.config({packages: jam.packages, shim: jam.shim});
}
else {
    var require = {packages: jam.packages, shim: jam.shim};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}