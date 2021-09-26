object HighOrderFunction {
    def main(args: Array[String]): Unit = {
        // high order function
        def f(func: String => Unit): Unit = {
            func("alice")
        }
        f((name: String) => { println(name) })
        f((name) => println(name))
        f(println(_))
        f(println)

        // define a binary operation of 1 and 2, but the specific operation of the two operands not specified
        def dualOp(func: (Int, Int) => Int): Int = {
            func(1, 2)
        }
        println(dualOp((a: Int, b: Int) => a + b))
        println(dualOp((a: Int, b: Int) => a - b))
        println(dualOp((a, b) => a - b))
        println(dualOp(_ + _)) // a + b
        println(dualOp(-_ + _)) // -a + b

        // define function
        def foo(n: Int): Int = {
            println("call foo")
            n + 1
        }
        // function assign to value
        val func = foo _ // represent the function foo, not function call
        val func1: Int => Int = foo
        println(func) // Main$$$Lambda$674/0x000000080103c588@770beef5
        println(func1)

        // function as arguments
        def dualEval(op: (Int, Int) => Int, a: Int, b: Int) = {
            op(a, b)
        }
        def add(a: Int, b: Int): Int = a + b
        println(dualEval(add, 10, 100)) // 110
        val mul:(Int, Int) => Int = _ * _
        println(dualEval(mul, 10, 100)) // 1000
        println(dualEval((a, b) => a + b, 1000 , 24)) // 1024

        // function as return value
        def outerFunc(): Int => Unit = {
            def inner(a: Int): Unit = {
                println(s"call inner with argument ${a}")
            }
            inner // return a function
        }
        println(outerFunc()(10)) // inner return ()
    }
}