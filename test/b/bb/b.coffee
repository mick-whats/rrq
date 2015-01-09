rrq = require('../../..').require2
reqpath = require('../../..').requirePath
module.exports =
  val:'bbq'
  get_c:->
    return rrq('test/b/cc/c')
  get_c2:->
    p = reqpath(__dirname,'test/b/cc/c')
    return require p
