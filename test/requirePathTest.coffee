path = require 'path'

assert = require('chai').assert
fs = require 'fs'
# rrq = require('..').require2
tf = require('./testFuncs')
rq = require('..')
describe 'require module test',->
  root = ''
  basename = './.rrqrc'
  before (done)->
    tf.makeRootFile (err)->
      throw err if err
      done()
  afterEach (done)->
    done()
  after (done)->
    tf.unlinkRootFile (err)->
      throw err if err
      done()
  it 'require: a/a',->
    p = rq.requirePath(__dirname,'/test/a/a')
    a = require p
    assert.equal 'abc',a.val
  it 'require: b/bb/b',->
    p = rq.requirePath(__dirname,'/test/b/bb/b')
    b = require p
    assert.equal 'bbq',b.val
  it 'require: b/cc/c',->
    p = rq.requirePath(__dirname,'/test/b/cc/c')
    c = require p
    assert.equal 'ccb',c.val
  it 'require b -> c', ->
    p = rq.requirePath(__dirname,'test/b/bb/b')
    b = require p
    assert.equal 'ccb',b.get_c2().val
  it 'require c -> a', ->
    p = rq.requirePath(__dirname,'test/b/cc/c')
    c = require p
    assert.equal 'abc',c.get_a2().val
  it 'require a -> b', ->
    p = rq.requirePath(__dirname,'test/a/a')
    a = require p
    assert.equal 'bbq',a.get_b2().val
