###
project rootに設定したファイル名を設定してみるtest
.rrqから始まるファイル名だけが認識される
###
assert = require('chai').assert
fs = require 'fs'
projectRoot = require('..').projectRoot
tf = require('./testFuncs')
describe 'root filename is...',->
  root = ''
  basename = ''
  nextname = ''
  errMsg = /Please make a \[\.rrqrc\] file in the project root directory/
  before (done)->
    tf.makeRootFile (err)->
      root = projectRoot()
      basename = root + '/.rrqrc'
      done()
  afterEach (done)->
    fs.rename nextname,basename,(err,result)->
      throw err if err
      done()
  after (done)->
    tf.unlinkRootFile (err)->
      throw err if err
      done()
  it '.rqqrc',->
    nextname = root + '/.rrqrc'
    fs.renameSync(basename,nextname)
    assert.doesNotThrow ->
      projectRoot()
  it '.rqq',->
    nextname = root + '/.rrq'
    fs.renameSync(basename,nextname)
    assert.doesNotThrow ->
      projectRoot()
  it '.rqq.conf.yaml',->
    nextname = root + '/.rrq.conf.yaml'
    fs.renameSync(basename,nextname)
    assert.doesNotThrow ->
      projectRoot()
  it 'ng: .vimrc',->
    nextname = root + '/.vimrc'
    fs.renameSync(basename,nextname)
    assert.throws ->
      projectRoot()
    ,errMsg
  it 'ng: rrqrc',->
    nextname = root + '/rrqrc'
    fs.renameSync(basename,nextname)
    assert.throws ->
      projectRoot()
    ,errMsg
