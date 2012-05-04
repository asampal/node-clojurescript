` // TOP `

fs   = require 'fs'
java = require 'java'

java.classpath.push ( __dirname + '/support/clojure-clojure-8306949/clojure-1.4.0.jar' )
java.classpath.push ( __dirname + '/support/compiler-20111114/compiler.jar' )
java.classpath.push ( __dirname + '/support/clojure-clojurescript-7472ab9/src/clj' )
java.classpath.push ( __dirname + '/support/clojure-clojurescript-7472ab9/src/cljs' )

StringReader = java.import 'java.io.StringReader'
Compiler     = java.import 'clojure.lang.Compiler'

ClojureScript = {}

ClojureScript.VERSION = VERSION = '0.0.0-3-pre'

#cljsc = fs.readFileSync ( __dirname + '/support/clojure-clojurescript-7472ab9/src/clj/cljs/closure.clj' ), 'utf8'
#cljscSR = new StringReader cljsc
#Compiler.loadSync cljscSR
#
#compileFile = java.callStaticMethodSync 'clojure.lang.RT', 'var', 'cljs.closure', 'compile-file'

ncljsc = fs.readFileSync ( __dirname + '/ncljsc.clj' ), 'utf8'
ncljscSR = new StringReader ncljsc
Compiler.loadSync ncljscSR

build = java.callStaticMethodSync 'clojure.lang.RT', 'var', 'ncljsc', 'build'

ClojureScript.compile = compile = (filename) ->
  build.invokeSync filename
