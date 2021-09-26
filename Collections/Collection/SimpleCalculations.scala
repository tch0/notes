object Calculations {
    def main(args: Array[String]): Unit = {
        // calculations of collections
        val list = List(1, 4, 5, 10)
        
        // sum
        var sum = 0
        for (elem <- list) sum += elem
        println(sum)
        
        println(list.sum)
        println(list.product)
        println(list.min)
        println(list.max)

        val list2 = List(('a', 1), ('b', 2), ('d', -3))
        println(list2.maxBy((tuple: (Char, Int)) => tuple._2))
        println(list2.minBy(_._2))

        // sort, default is ascending
        val sortedList = list.sorted
        println(sortedList)
        // descending
        println(list.sorted(Ordering[Int].reverse))

        // sortBy
        println(list2.sortBy(_._2))

        // sortWith
        println(list.sortWith((a, b) => a < b))
        println(list2.sortWith(_._2 > _._2))
    }
}