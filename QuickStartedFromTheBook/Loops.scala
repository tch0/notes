object Loops {
    def main(args : Array[String]): Unit = {
        // while loop
        whileLoop

        // for loop
        // var i : Int = 0
        // for(i <- 0 until args.length) {
        //     println(args[i])
        // }

        // foreach
        args.foreach {
            arg => println(arg)
        }
        println(args)
    }

    def whileLoop: Unit = {
        var i = 1
        while (i <= 3) {
            println("hello")
            i += 1
        }
    }
}