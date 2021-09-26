object HighOrderFuncExamples {
    def main(args: Array[String]): Unit = {

        // deal with an array, get a new array
        // map operation of array
        def arrayOp(arr: Array[Int], op: Int => Int): Array[Int] = {
            for (elem <- arr) yield op(elem) // the whold for expression get a new array
        }
        val arr = Array(1, 2, 3, 4)
        def addOne(elem: Int): Int = elem + 1
        println(arrayOp(arr, addOne _).mkString(", ")) // pass addOne also work
        println(arrayOp(arr, elem => elem * 2).mkString(", "))
        println(arrayOp(arr, _ * 3).mkString(", "))

        // practice, (Int, String, Char) => Boolean, when fun(0, "", '0') -> fasle, other -> true
        val fun = (a: Int, b: String, c: Char) => a == 0 && b == "" && c == '0'
        println(fun(1, "", 0))
        println(fun(0, "", '0'))
        println("============================")

        // func(0)("")('0') return fasle, other true
        def func(a: Int): String => (Char => Boolean) = {
            def f1(s: String): Char => Boolean = {
                def f2(c: Char): Boolean = { 
                    if (a == 0 && s == "" && c == '0') false else true
                }
                f2
            }
            f1
        }
        println(func(0)("")('0')) // false
        println(func(1)("hello")('c')) // true

        // simplify to anonymous function
        def func1(a: Int): String => (Char => Boolean) = {
            s => c => !(a == 0 && s == "" && c == '0')
        }
        println(func1(0)("")('0')) // false
        println(func1(1)("hello")('c')) // true

        // Currying 
        def func2(a: Int)(s: String)(c: Char): Boolean = !(a == 0 && s == "" && c == '0')
        println(func2(0)("")('0')) // false
        println(func2(1)("hello")('c')) // true
    }
}