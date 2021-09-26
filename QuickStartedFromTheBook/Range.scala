object Range {
    def main(args: Array[String]): Unit = {
        // default step is 1
        val range: Range = 0 until 10 by 2
        range.foreach {
            arg => println(arg)
        }
    }
}