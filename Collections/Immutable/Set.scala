object SetTest {
    def main(args: Array[String]): Unit = {
        // create
        val s = Set(10, 10, 20, 30)
        println(s)

        // add element: +
        val set2 = s + 40
        println(set2)

        // merge sets: 
        val set3 = set2 ++ Set(15, 20, 30, 5)
        println(set3)

        // remove elements
        val set4 = set3 - 15 - 5
        println(set4)
    }
}