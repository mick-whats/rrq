###
v1.1.1
2015/01/13 20:07
###

fs =require 'fs'
path = require 'path'
util = require 'util'
class Rrq
  _confpath = ''
  @projectRoot:()->
    dir = __dirname
    while 1
      files = fs.readdirSync dir
      for file in files
        if /^\.rrq/.test(file)
          _confpath = file
          return dir
      dir = path.dirname(dir)
      if dir is '/'
        throw new Error('Please make a [.rrqrc] file in the project root directory')
  @root:@projectRoot
  @confpath:->
    r = @root()
    return path.join(r, _confpath)

  @require2:(_path)=>
    root = @projectRoot()
    return require path.join(root,_path)
  @require:@require2
  @requirePath:(dirname,directoryPath)=>
    p = path.relative(dirname, path.join(@projectRoot(),directoryPath))
    unless /^\.\./.test(p)
      p = './' + p
    return p
module.exports = Rrq
