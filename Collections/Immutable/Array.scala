object ArrayTest {
    def main(args: Array[String]): Unit = {
        // 1. new
        val arr = new Array[Int](5)
        
        // 2. factory method in companion obejct
        val arr1 = Array[Int](5)
        val arr2 = Array(0, 1, 3, 4)

        // 3. traverse, range for
        for (i <- 0 until arr.length) arr(i) = i
        for (i <- arr.indices) print(s"${arr(i)} ")
        println()

        // 4. tarverse, foreach
        for (elem <- arr) print(s"$elem ") // elem is a val
        println()

        // 5. tarverse, use iterator
        val iter = arr.iterator
        while (iter.hasNext)
            print(s"${iter.next()} ")
        println()

        // 6. traverse, use foreach method, pass a function
        arr.foreach((elem: Int) => print(s"$elem "))
        println()
        
        println(arr2.mkString(", ")) // to string directly

        // 7. add element, return a new array
        val newArr = arr :+ 10 //  arr.:+(10) add to end
        println(newArr.mkString(", "))
        val newArr2 = 20 +: 10 +: arr :+ 30 // arr.+:(10).+:(20).:+(30), add to begin
        println(newArr2.mkString(", "))
    }
}