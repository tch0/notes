object Tuple {
    def main(args: Array[String]): Unit = {
        // not started from 0
        // will static type check for every element
        val t = ("hello", 100, ("yes", 10.1))
        println(t._1)
        println(t._2)
        println(t._3._2)
    }
}