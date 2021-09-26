package com {
    // code in com package
    object Outer {
        var name = "Outer"
    }
    package inner {
        // code in com.inner package
        package scala {
            // code in com.innner.scala package
            object Inner {
                def main(args: Array[String]):Unit = {
                    println(Outer.name)
                    Outer.name = "Inner"
                    println(Outer.name)
                }
            }
        }
    }
}