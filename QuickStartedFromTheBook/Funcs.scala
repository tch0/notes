object Funcs {
    def main(args: Array[String]): Unit = {
        // high order functions
        // a high order function is a function that use or create functions\
        
        // foreach
        // iteration method
        // accept a anonymous function
        // anonymous function: parameters => function body
        val list = List("hello", "world")
        list.foreach(word => println(word))
        val m = Map(1 -> "one", 2 -> "two")
        m.foreach(kvtuple => println(s"${kvtuple._1}, ${kvtuple._2}"))

        println(list.isEmpty)
        println(list.length)
        println(list.size)
        println(list.head) // hello
        println(list.tail) // List(world), other elements except head
        println(list.last) // world
        println(list.init) // List(hello), other elements except last
        println(list.reverse)

        // high order functions of list
        val words = List("b", "a", "key", "joke")
        println(words.count(word => word.size > 2)) // 2
        println(words.filter(word => word.size > 2)) // List(key, joke)
        println(words.forall(word => word.size > 1)) // fasle
        println(words.exists(word => word.size == 4)) // true

        val swords = words.sortWith((s, t) => s.charAt(0).toLower < t.charAt(0).toLower)
        println(swords) // List(a, b, joke, key)
        
        // foldLeft
        // /: is a operator
        // initialValue /: List codeBlock
        val nums = List(1, 2, 3, 4)
        // initial value of sum will be 0, code block will apply to all elements in the list
        val sum = (0 /: nums) {(sum, i) => sum + i}
        println(sum)

        // currying 柯里化
        nums.foldLeft(0)((sum, value) => sum + value)

    }
}