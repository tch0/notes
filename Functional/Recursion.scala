object Recursive {
    def main(args: Array[String]): Unit = {
        println(factorial(10))
    }

    def factorial(n: Int) : Int = {
        if (n < 0)
            return -1
        if(n == 0)
            return 1 
        factorial(n-1) * n
    }
    // tail recusion implementation of factorial
    def tailFact(n: Int): Int = {
        if (n < 0)
            return -1
        @annotation.tailrec
        def loop(n: Int, curRes: Int): Int = {
            if (n == 0)
                return curRes
            loop(n - 1, curRes * n)
        }
        loop(n, 1)
    }
}