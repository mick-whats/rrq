rrq = require('../..').require2
reqpath = require('../..').requirePath
module.exports =
  val:'abc'
  get_b:->
    return rrq('test/b/bb/b')
  get_b2:->
    p = reqpath(__dirname,'test/b/bb/b')
    return require p
