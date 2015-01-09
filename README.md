# RRQ
requireをルートディレクトリからの指定で呼び出せるようになります。

```coffee
#before
require('../../pathTest/c/cc/c')

# after
rrq('pathTest/c/cc/c')
```
## install

```
npm install rrq
touch .rrqrc
```
インストール後、プロジェクトルートに[.rrqrc]というファイルを作成します。空で構いません。  
このファイルのある場所をルートと認識してパスを解析します。

* ファイル名は[.rrqrc]でなくても[.rrq]で始まるものならなんでも構いません。
* 例[.rrq][.rrqrc][.rrq.conf.yaml]等

## how to use


```coffee
rrq = require('rrq').require2

# use of require
c1 = require('../../pathTest/c/cc/c')
c1('c1')

# use of rrq
c2 = rrq('pathTest/c/cc/c')
c2('c2')

# get require path
requirePath = require('rrq').requirePath

cpath = requirePath(__dirname,'pathTest/c/cc/c')
console.log('require:', cpath)
c3 = require(cpath)
c3('c3')

###
c required
c1 test ok
c2 test ok
require: ../../pathTest/c/cc/c
c3 test ok
###
```

### require2(path)
ルートディレクトリからのパスでrequireする

```coffee
rrq = require('rrq').require2

# use of require
c1 = require('../../pathTest/c/cc/c')
c1('c1')

# use of rrq
c2 = rrq('pathTest/c/cc/c')
c2('c2')
```

### requirePath(from,to)
ルートディレクトリからのパスでrequireするパスを取得する  
[path.relative(from, to)](http://nodejs.jp/nodejs.org_ja/api/path.html#path_path_relative_from_to) と同じですが、fromを__dirname、toをルートからのパスで指定できます。  
第一引数は `__dirname`で固定です。
path.relative(from, to)との違いは、[../]で始まるパス以外は先頭に[./]を付与します。

```coffee
rq = require('rrq')
rq.requirePath(__dirname,'pathTest/c/cc/c')
# ../../pathTest/c/cc/c
```
### projectRoot()
ルートディレクトリのパスを取得する

```coffee
rq = require('rrq')
root = rq.projectRoot()
console.log root

# /Users/hoge/path/to/myProject
```
