object Closure {
    def main(args: Array[String]): Unit = {
        def add(a: Int, b: Int): Int = {
            a + b
        }

        // with a certain operand, another operand varies
        def addByFour(b: Int): Int = {
            4 + b
        }

        // certain operand changes
        def addByVal(a: Int) : Int => Int = a + _
        println(add(4, 3))
        val addByFour2 = addByVal(4)
        println(addByFour2(3))
    }
}