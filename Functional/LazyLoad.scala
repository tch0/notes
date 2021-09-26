object LazyLoad {
    def main(args: Array[String]): Unit = {
        // just like pass by name
        lazy val result: Int = sum(13, 47)

        println("before lazy load")
        println(s"result = ${result}") // first call sum(13, 47)
        println(s"result = ${result}") // result has been evaluated
    }

    def sum(a: Int, b: Int): Int = {
        println("call sum")
        a + b
    }
}