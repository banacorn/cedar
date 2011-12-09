(function() {
  var File, file;

  File = (function() {

    File.ID = 0;

    function File(name, type, id) {
      this.name = name;
      this.type = type != null ? type : 'file';
      this.id = id != null ? id : File.ID++;
    }

    return File;

  })();

  file = {
    '/': [new File('Apple'), new File('Book'), new File('Cat'), new File('Dog'), new File('Music', 'folder')],
    '/music': [new File('Meet Me in the Basement.mp3'), new File('Broken Social Scene - You Forgot It in People', 'folder'), new File('Broken Social Scene - Forgiveness Rock Record', 'folder')]
  };

  exports.file = file;

}).call(this);
