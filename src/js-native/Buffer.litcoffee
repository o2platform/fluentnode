**fluent-buffer** are methods that extend the Javascript's Buffer object

    fs        = require('fs')

@.**save_As** (value...)

Saves Buffer

    Buffer::save_As = (file_Path)->
      out       = fs.createWriteStream(file_Path)
      out.write(@);
      file_Path