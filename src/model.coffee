define [
    'models/project'
    'collections/project'
    'models/locale'
    'collections/locale'
    'models/breadcrumb', 
    'collections/filetree'
], (Project, Projects, Locale, Locales, Breadcrumb, FileTree) ->
    
    Project     : Project
    Projects    : Projects
    
    Locale      : Locale
    Locales     : Locales
    
    Breadcrumb  : Breadcrumb

    FileTree    : FileTree