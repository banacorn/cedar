class File
    @ID: 0
    constructor: (@name, @type = 'file', @id = File.ID++) ->
        
    
    
file =
    '/': [
        new File 'Apple'
        new File 'Book'
        new File 'Cat'
        new File 'Dog'
        new File 'Music', 'folder'
    ]
    '/music': [
        new File 'Meet Me in the Basement.mp3'
        new File 'Broken Social Scene - You Forgot It in People', 'folder'
        new File 'Broken Social Scene - Forgiveness Rock Record', 'folder'
    ]
    
exports.file = file
