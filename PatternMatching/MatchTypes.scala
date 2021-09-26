object MatchTypes {
    def main(args: Array[String]): Unit = {

        // match constant
        def describeConst(x: Any) = x match {
            case 1 => "Int one"
            case "hello" => "String hello"
            case true => "Boolean true"
            case '+' => "Char +"
            case _ => "empty"
        }

        println(describeConst(1))
        println(describeConst("hello"))
        println(describeConst(true))
        println(describeConst(false))

        println("============================================")
        // match type
        def describeType(x: Any) = x match {
            case i: Int => "Int " + i
            case s: String => "String " + s
            case list: List[String] => "List " + list
            case array: Array[Int] => "Array[Int] " + array
            case a => "Something else " + a 
        }

        println(describeType(20))
        println(describeType("hello"))
        println(describeType(List("hi", "hello"))) // match
        println(describeType(List(20, 30))) // match
        println(describeType(Array(10, 20))) // match
        println(describeType(Array("hello", "yes"))) // not match
        println(describeType((10, 20))) // match

        println("============================================")
        // match array
        for (arr <- List(
            Array(0),
            Array(1, 0),
            Array(1, 1, 0),
            Array(10, 2, 7, 5),
            Array("hello", 20, 50)
        )) {
            val result = arr match {
                case Array(0) => "0"
                case Array(1, 0) => "Array(1, 0)"
                case Array(x, y) => s"Array($x, $y)" // Array of two elements
                case Array(0, _*) => s"an array begin with 0"
                case Array(x, 1, z) => s"an array with three elements, no.2 is 1"
                case Array(x:String, _*) => s"array that first element is a string"
                case _ => "somthing else"
            }
            println(result)
        }

        println("============================================")
        for (list <- List(
            List(0),
            List(1, 0),
            List(0, 0, 0),
            List(1, 1, 0),
            List(88)
        )) {
            val result = list match {
                case List(0) => "List(0)"
                case List(x, y) => s"List($x, $y)"
                case List(0, _*) => "List(0, ...)"
                case List(a) => s"List($a)"
                case _ => "somthing else"
            }
            println(result)
        }
        
        println("============================================")
        val list = List(1, 3, 4, 5, 100)
        list match {
            case first :: second :: rest => println(s"first $first, second $second, rest $rest")
            case _ => println("something else")
        }

        println("============================================")
        // pattern matching in variable declaration
        val (x, y) = (1, "hello")
        println(x)
        println(y)
        // val List(first, second, _*) = List(1, 2, 3)
        val first :: second :: rest = List(1, 3, 4, 100)
        println(rest)

        for ((1, second) <- List((1, 3), (2, 4), (1, 100))) {
            println(second)
        }
    }
}