fs =require 'fs'
path = require 'path'
util = require 'util'
class Rrq
  @projectRoot:()->
    dir = __dirname
    while 1
      files = fs.readdirSync dir
      for file in files
        if file is '.rrqrc'
          return dir
      dir = @upperDir(dir)
      if dir is '/'
        throw new Error('Please smake a [.pddrc] file in the project root directory')

  @upperDir:(dirPath)->
    arr = dirPath.split(path.sep)
    newdir = '/'
    for i in [1...arr.length-1]
      newdir = path.join(newdir,arr[i])
    return newdir
  @require2:(_path)=>
    root = @projectRoot()
    return require path.join(root,_path)
  @requirePath:(dirname,directoryPath)=>
    return path.relative(dirname, path.join(@projectRoot(),directoryPath))
module.exports = Rrq
