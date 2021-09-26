object Function {
    def main(args: Array[String]): Unit = {
        // no parameters, return ()
        def f1(): Unit = {
            println("hello")
            return ()
        }
        println(f1())

        // no parameters, has return value
        def f2(): Int = {
            println("f2() : Int")
            return 1
        }
        println(f2())

        // has parameters, has return value
        def f3(name: String): Int = {
            println(s"f3(${name}): Unit")
            return 3
        }
        println(f3("alice"))

        // variable parameter, in java, use ... as a array
        def f4(str:String*): Unit = {
            println(str)
            for (s <- str) {
                print(s"$s ")
            }
            println()
        }
        f4()
        f4("alice")
        f4("aaa", "bb", "cc")

        // defualt value of parameter
        def f5(name: String = "alice"): Unit = {
            println(s"default argument, name : ${name}")
        }
        f5()

        // named argument
        def f6(name: String, age: Int = 20, loc: String = "BeiJing"): Unit = {
            println(s"name ${name}, age ${age}, location ${loc}")
        }
        f6("Bob")
        f6("Alice", loc = "Xi'An")
        f6("Michael", 30)

        // simplify paramters as you can
        def f7(name: String) = name // simplify return, {}, return type
        println(f7("alice"))

        def f8(name: String) { // simplify = when return type is Unit, deprecated after 2.13.0
            println(name)
        }
        def f9(): Unit = {
            println("no paramter")
        }
        f9 // deprecated after 2.13.3

        // anonymous function, lambda expression
        val fun = (name: String) => { println(s"$name") }
        println(fun)
        fun("Alice")
    }
}