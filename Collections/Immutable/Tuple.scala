object TupleTest {
    def main(args: Array[String]): Unit = {
        // create
        val tuple: (String, Int, Char, Boolean) = ("hello", 100, 'a', true)
        println(tuple)

        println(tuple._1)
        println(tuple._4)

        // traverse
        for(elem <- tuple.productIterator) {
            print(s"$elem ")
        }
        println()
    }
}