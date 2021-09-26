object NullType {
    def main(arg : Array[String]) : Unit = {
        // Unit
        def f1(): Unit = {
            println("just nothing!")
        }
        val a = f1()
        println(a) // ()

        // Null
        // val n:Int = null // invalid
    }
}