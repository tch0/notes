object PartialFunctionTest {
    def main(args: Array[String]): Unit = {
        val list: List[(String, Int)] = List(("a", 12), ("b", 10), ("c", 100), ("a", 5))

        // keep first constant and double second value of the tuple
        // 1. use map
        val newList = list.map(tuple => (tuple._1, tuple._2 * 2))
        println(newList)

        // 2. pattern matching
        val newList1 = list.map(
            tuple => {
                tuple match {
                    case (x, y) => (x, y * 2)
                }
            }
        )
        println(newList1)

        // simplify to partial function
        val newList2 = list.map {
            case (x, y) => (x, y * 2) // this is a partial function
        }
        println(newList2)

        // application of partial function
        // get absolute value
        // deal with: negative, 0, positive
        val positiveAbs: PartialFunction[Int, Int] = {
            case x if x > 0 => x
        }
        val negativeAbs: PartialFunction[Int, Int] = {
            case x if x < 0 => -x
        }
        val zeroAbs: PartialFunction[Int, Int] = {
            case 0 => 0
        }

        // combine a function with three partial functions
        def abs(x: Int): Int = (positiveAbs orElse negativeAbs orElse zeroAbs) (x)
        println(abs(-13))
        println(abs(30))
        println(abs(0))
    }
}