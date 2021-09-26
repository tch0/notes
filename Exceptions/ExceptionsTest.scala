object Exceptionstest {
    def main(args: Array[String]): Unit = {
        // test of exceptions
        try {
            val n = 10 / 0
        } catch {
            case e: ArithmeticException => {
                println(s"ArithmeticException raised.")
            }
            case e: Exception => {
                println("Normal Exceptions raised.")
            }
        } finally {
            println("finally")
        }
    }
}