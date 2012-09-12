define [
    'models/project'
    'collections/project'
    'collections/locale'
    'models/projectbreadcrumb', 
    'collections/filetree'
    'collections/localetree'
    'collections/entrylist'
    'collections/entry'
], (Project, ProjectList, Locales, ProjectBreadcrumb, FileTree, LocaleTree, EntryList, Entries) ->
    
    Project     : Project
    ProjectList : ProjectList
    
    Locales     : Locales
    
    ProjectBreadcrumb  : ProjectBreadcrumb

    FileTree    : FileTree
    LocaleTree  : LocaleTree
    EntryList   : EntryList
    Entries     : Entries

