object CollectionOperations {
    def main(args: Array[String]): Unit = {
        // length
        val list = List(1, 3, 4)
        println(list.length)

        println(list.size)

        // size
        val set = Set(1, 3, 4, 5)
        println(set.size)

        // traverse
        for (elem <- set.iterator) println(elem)

        // to string
        println(set.mkString(", "))

        // contains
        println(set.contains(3))
        println(list.contains(1))
    }
}