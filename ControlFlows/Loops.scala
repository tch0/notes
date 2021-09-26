import scala.util.control.Breaks
object Loops {
    def main(args: Array[String]): Unit = {
        // range for
        // 1 to 10 is a method call, return a range
        for (i <- 1 to 10) {
            print(s"${i} ")
        }
        println()
        
        // Range: start until inclusiveEnd by step
        // Range: start until exclusiveEnd by step
        // by is a method of Range, parameter is step, return a new Range
        // step can be negative, like -2, can not be 0
        for (i <- 1 until 10 by 2) {
            print(s"${i} ")
        }
        println()

        for (i <- 10 to 1 by -1) {
            print(s"$i ")
        }
        println()
        
        // trverse collections
        for (i <- List(10, 100, 1000)) {
            print(s"${i} ")
        }
        println()

        // loop guard
        for (i <- 1 to 10 if i % 2 == 0) {
            print(s"${i} ") // 2 4 6 8 10
        }
        println()

        // nested loop
        for (i <- 1 to 3) {
            for (j <- 1 to 3) {
                println("i = " + i + ", j = " + j)
            }
        }
        for (i <- 1 to 4; j <- 1 to 5) {
            println("i = " + i + ", j = " + j)
        }
        
        // multiply table
        for (i <- 1 to 9) {
            for (j <- 1 to i) {
                print(s"$j * $i = ${i * j} \t")
            }
            println()
        }
        // simplify
        for (i <- 1 to 9; j <- 1 to i) {
            print(s"$j * $i = ${i * j} \t")
            if (j == i) println()
        }

        // 引入变量
        for (i <- 1 to 10; j = 10 - i) {
            println("i = " + i + ", j = " + j)
        }
        // equals to 
        for {
            i <- 1 to 10
            j = 10 - i
        } {
            println("i = " + i + ", j = " + j)
        }

        // example, print pyramid
        for (i <- 1 to 10) {
            println(s"${" " * (10-i)}${"*"*(2*i - 1)}")
        }
        // equals to
        for (i <- 1 to 10; stars = 2*i - 1; spaces = 10 - i) {
            println(" " * spaces + "*" * stars)
        }

        // return value of loop
        val ret = for (i <- 1 to 10) {
            i
        }
        println(ret) // ()

        // yield keyword
        val v = for (i <- 1 to 10) yield i * i
        println(v) // default implementation is Vector

        // while
        var sum = 0
        var i = 1
        while (i <= 10) {
            sum += i
            i += 1
        }
        println(sum)


        // exception replace break
        try {
            for (i <- 0 to 10) {
                if (i == 3)
                    throw new RuntimeException
                println(i)
            }
        } catch {
            case e: Exception => // do nothing
        }
        // use Breaks.break
        Breaks.breakable(
            for (i <- 0 to 10) {
                if (i == 3)
                    Breaks.break()
                println(i)
            }
        )
    }
}