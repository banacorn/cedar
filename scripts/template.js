// Generated by CoffeeScript 1.4.0
(function() {

  define(['hogan', 'text!../templates/file.html', 'text!../templates/home.html', 'text!../templates/layout.html', 'text!../templates/project/list.html', 'text!../templates/project/listitem.html', 'text!../templates/project.html', 'text!../templates/registration.html'], function(Hogan, File, Home, Layout, ProjectList, ProjectListitem, Project, Registration) {
    return {
      file: Hogan.compile(File),
      home: Hogan.compile(Home),
      layout: Hogan.compile(Layout),
      projectList: Hogan.compile(ProjectList),
      projectListitem: Hogan.compile(ProjectListitem),
      project: Hogan.compile(Project),
      registration: Hogan.compile(Registration)
    };
  });

}).call(this);
