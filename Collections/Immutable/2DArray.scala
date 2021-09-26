object TwoDArrayTest {
    def main(args: Array[String]): Unit = {
        // create 2d array
        val arr: Array[Array[Int]] = Array.ofDim[Int](2, 3)
        arr(0)(1) = 10
        arr(1)(0) = 100
        
        // traverse
        arr.foreach(v => println(v.mkString(",")))
    }
}