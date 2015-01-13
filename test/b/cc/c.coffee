rrq = require('../../..').require2
reqpath = require('../../..').requirePath
module.exports =
  val:'ccb'
  get_a:->
    return rrq('test/a/a')
  get_a2:->
    p = reqpath(__dirname,'test/a/a')
    return require p
