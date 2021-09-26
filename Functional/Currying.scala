object Currying {
    def main(args: Array[String]): Unit = {

        // Currying 
        def add(a: Int)(b: Int): Int = a + b
        println(add(4)(3))
        val addFour = add(4) _
        // val addFour: Int => int = add(4)
        println(addFour(3))
    }
}