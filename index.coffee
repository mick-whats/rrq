fs =require 'fs'
path = require 'path'
util = require 'util'
class Rrq
  @projectRoot:()->
    dir = __dirname
    while 1
      files = fs.readdirSync dir
      for file in files
        if /^\.rrq/.test(file)
          return dir
      dir = path.dirname(dir)
      if dir is '/'
        throw new Error('Please make a [.rrqrc] file in the project root directory')

  @require2:(_path)=>
    root = @projectRoot()
    return require path.join(root,_path)
  @requirePath:(dirname,directoryPath)=>
    return path.relative(dirname, path.join(@projectRoot(),directoryPath))
module.exports = Rrq
