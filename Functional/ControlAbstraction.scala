object ControlAbstraction {
    def main(args: Array[String]): Unit = {
        // pass by value
        def f0(a: Int): Unit = {
            println("a: " + a)
            println("a: " + a)
        }
        f0(10)

        // pass by name, argument can be a code block that return to Int
        def f1(a: => Int): Unit = {
            println("a: " + a)
            println("a: " + a)
        }
        def f2(): Int = {
            println("call f2()")
            10
        }
        f1(10)
        f1(f2()) // pass by name, just replace a with f2(), then will call f2() twice
        f1({
            println("code block")
            30
        })

        // built-in while
        var n = 10
        while (n >= 1) {
            print(s"$n ")
            n -= 1
        }
        println()

        // application: self-defined while, implement a function of while keyword
        def myWhile(condition: => Boolean): (=> Unit) => Unit = {
            def doLoop(op: => Unit): Unit = {
                if (condition) {
                    op
                    myWhile(condition)(op)
                }
            }
            doLoop _
        }

        n = 10
        myWhile (n >= 1) {
            print(s"$n ")
            n -= 1
        }
        println()

        // simplfy
        def myWhile2(condition: => Boolean): (=> Unit) => Unit = {
            op => {
                if (condition) {
                    op
                    myWhile2(condition)(op)
                }
            }
        }

        n = 10
        myWhile (n >= 1) {
            print(s"$n ")
            n -= 1
        }
        println()

        // use currying
        def myWhile3(condition: => Boolean)(op: => Unit): Unit = {
            if (condition) {
                op
                myWhile3(condition)(op)
            }
        }

        n = 10
        myWhile3 (n >= 1) {
            print(s"$n ")
            n -= 1
        }
        println()
    }
}