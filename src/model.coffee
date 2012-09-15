define [
    'models/project'
    'collections/project'
    'collections/locale'
    'models/projectbreadcrumb', 
    'models/filebrowser', 
    'collections/filetree'
    'collections/localetree'
    'collections/entry'
], (Project, ProjectList, Locales, ProjectBreadcrumb, FileBrowser, FileTree, LocaleTree, Entries) ->
    
    Project     : Project
    ProjectList : ProjectList
    
    Locales     : Locales
    
    ProjectBreadcrumb  : ProjectBreadcrumb

    FileBrowser : FileBrowser

    FileTree    : FileTree
    LocaleTree  : LocaleTree
    Entries     : Entries
