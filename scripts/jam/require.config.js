var jam = {
    "packages": [
        {
            "name": "backbone",
            "location": "scripts/jam/backbone",
            "main": "backbone.js"
        },
        {
            "name": "hogan",
            "location": "scripts/jam/hogan",
            "main": "hogan.js"
        },
        {
            "name": "jquery",
            "location": "scripts/jam/jquery",
            "main": "jquery.js"
        },
        {
            "name": "lodash",
            "location": "scripts/jam/lodash",
            "main": "./lodash.js"
        },
        {
            "name": "underscore",
            "location": "scripts/jam/underscore",
            "main": "underscore.js"
        }
    ],
    "version": "0.2.12",
    "shim": {
        "backbone": {
            "deps": [
                "underscore"
            ],
            "exports": "Backbone"
        },
        "hogan": {
            "exports": "hogan"
        },
        "underscore": {
            "exports": "_"
        }
    }
};

if (typeof require !== "undefined" && require.config) {
    require.config({
    "packages": [
        {
            "name": "backbone",
            "location": "scripts/jam/backbone",
            "main": "backbone.js"
        },
        {
            "name": "hogan",
            "location": "scripts/jam/hogan",
            "main": "hogan.js"
        },
        {
            "name": "jquery",
            "location": "scripts/jam/jquery",
            "main": "jquery.js"
        },
        {
            "name": "lodash",
            "location": "scripts/jam/lodash",
            "main": "./lodash.js"
        },
        {
            "name": "underscore",
            "location": "scripts/jam/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore"
            ],
            "exports": "Backbone"
        },
        "hogan": {
            "exports": "hogan"
        },
        "underscore": {
            "exports": "_"
        }
    }
});
}
else {
    var require = {
    "packages": [
        {
            "name": "backbone",
            "location": "scripts/jam/backbone",
            "main": "backbone.js"
        },
        {
            "name": "hogan",
            "location": "scripts/jam/hogan",
            "main": "hogan.js"
        },
        {
            "name": "jquery",
            "location": "scripts/jam/jquery",
            "main": "jquery.js"
        },
        {
            "name": "lodash",
            "location": "scripts/jam/lodash",
            "main": "./lodash.js"
        },
        {
            "name": "underscore",
            "location": "scripts/jam/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore"
            ],
            "exports": "Backbone"
        },
        "hogan": {
            "exports": "hogan"
        },
        "underscore": {
            "exports": "_"
        }
    }
};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}