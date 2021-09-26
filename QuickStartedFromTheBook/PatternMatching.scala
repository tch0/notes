object PatternMatching {
    def main(args: Array[String]): Unit = {
        println(matching("yes"))
        println(matching("no"))
        println(matching("what"))

        println(factorial(10))

        // regular expressions
        val reg = "the".r
        // println(reg)
        val iter = reg.findAllIn("the way is not the way I should go!")
        println(iter.foreach(v => println(v)))
    }
    
    // pattern matching : match {case => ...}, _ is wildcard
    def matching(input: String): String = input match {
        case "yes" => "oh ~~~"
        case "no" => "no ~~~"
        case _ => "do not sure ?"
    }

    // guard
    def factorial(n: Int): Int = n match {
        case 0 => 1
        case x if x > 0 => factorial(n-1) * n
        case _ => -1
    }
    
    
}