object HighLevelCalculations {
    def main(args: Array[String]): Unit = {
        val list = List(1, 10, 100, 3, 5, 111)
        
        // 1. map functions
        // filter
        val evenList = list.filter(_ % 2 == 0)
        println(evenList)

        // map
        println(list.map(_ * 2))
        println(list.map(x => x * x))

        // flatten
        val nestedList: List[List[Int]] = List(List(1, 2, 3), List(3, 4, 5), List(10, 100))
        val flatList = nestedList(0) ::: nestedList(1) ::: nestedList(2)
        println(flatList)

        val flatList2 = nestedList.flatten
        println(flatList2) // equals to flatList

        // map and flatten
        // example: change a string list into a word list
        val strings: List[String] = List("hello world", "hello scala", "yes no")
        val splitList: List[Array[String]] = strings.map(_.split(" ")) // divide string to words
        val flattenList = splitList.flatten
        println(flattenList)

        // merge two steps above into one
        // first map then flatten
        val flatMapList = strings.flatMap(_.split(" "))
        println(flatMapList)

        // divide elements into groups
        val groupMap = list.groupBy(_ % 2)
        val groupMap2 = list.groupBy(data => if (data % 2 == 0) "even" else "odd")
        println(groupMap)
        println(groupMap2)

        val worldList = List("China", "America", "Alice", "Curry", "Bob", "Japan")
        println(worldList.groupBy(_.charAt(0)))

        // 2. reduce functions
        // narrowly reduce
        println(List(1, 2, 3, 4).reduce(_ + _)) // 1+2+3+4 = 10
        println(List(1, 2, 3, 4).reduceLeft(_ - _)) // 1-2-3-4 = -8
        println(List(1, 2, 3, 4).reduceRight(_ - _)) // 1-(2-(3-4)) = -2, a little confusing

        // fold
        println(List(1, 2, 3, 4).fold(0)(_ + _)) // 0+1+2+3+4 = 10
        println(List(1, 2, 3, 4).fold(10)(_ + _)) // 10+1+2+3+4 = 20
        println(List(1, 2, 3, 4).foldRight(10)(_ - _)) // 1-(2-(3-(4-10))) = 8, a little confusing
    }
}