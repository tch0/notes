object DerivedCollections {
    def main(args: Array[String]): Unit = {
        // create
        val list1 = List(1, 3, 4, 5)
        val list2 = List(10, 100, 1, 3)

        // head and tail
        println(list1.head)
        println(list1.tail)

        // last and init
        println(list1.last)
        println(list1.init)

        // reverse
        println(list1.reverse)

        // take left/right n elements
        println(list1.take(3))
        println(list1.takeRight(3))

        // remove left/right n elements
        println(list1.drop(2))
        println(list1.dropRight(2))

        // ============= for two collections

        // union
        val union = list1.concat(list2)
        println(union)
        val set = Set(1, 3, 4)
        print(set.union(Set(1, 3, 5)))

        // intersection
        println(list1.intersect(list2))
        println(set.intersect(Set(1, 3, 5)))

        // substraction
        println(list1.diff(list2))
        println(list2.diff(list1))

        // get a colllection of tuple of two elements
        println("zip : " + list1.zip(list2))

        // slide window
        for (elem <- list1.sliding(3)) println(elem)
    }
}