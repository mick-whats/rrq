assert = require('chai').assert
fs = require 'fs'
rrq = require('..').require2
tf = require('./testFuncs')

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
    a = rrq 'test/a/a'
    assert.equal 'abc',a.val
  it 'require: b/bb/b',->
    b = rrq('test/b/bb/b')
    assert.equal 'bbq',b.val
  it 'require: b/cc/c',->
    c = rrq 'test/b/cc/c'
    assert.equal 'ccb',c.val
  it 'require b -> c', ->
    b = rrq('test/b/bb/b')
    assert.equal 'ccb',b.get_c().val
  it 'require c -> a', ->
    c = rrq('test/b/cc/c')
    assert.equal 'abc',c.get_a().val
  it 'require a -> b', ->
    a = rrq('test/a/a')
    assert.equal 'bbq',a.get_b().val
  it 'root() is projectRoot()',->
    a = require('..').root()
    b = require('..').projectRoot()
    assert.deepEqual a,b
  it 'require() is require2()',->
    a = require('..').require
    b = require('..').require2
    assert.deepEqual a,b
