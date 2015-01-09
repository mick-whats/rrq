fs = require 'fs'
class TestFunks
  basename = './.rrqrc'
  @makeRootFile:(cb)->
    fs.writeFile basename,null,(err)->
      return cb err if err
      cb(null)
  @unlinkRootFile:(cb)->
    fs.unlink basename,(err)->
      return cb err if err
      cb(null)
module.exports = TestFunks
