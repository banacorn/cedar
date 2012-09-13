define [
    'models/project'
    'collections/project'
    'collections/locale'
    'models/projectbreadcrumb', 
    'models/filebrowser', 
    'collections/filetree'
    'collections/localetree'
    'collections/entrylist'
    'collections/entry'
], (Project, ProjectList, Locales, ProjectBreadcrumb, FileBrowser, FileTree, LocaleTree, EntryList, Entries) ->
    
    Project     : Project
    ProjectList : ProjectList
    
    Locales     : Locales
    
    ProjectBreadcrumb  : ProjectBreadcrumb

    FileBrowser : FileBrowser

    FileTree    : FileTree
    LocaleTree  : LocaleTree
    EntryList   : EntryList
    Entries     : Entries

