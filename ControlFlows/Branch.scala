object Branches {
    def main(args: Array[String]): Unit = {
        var age = 20

        // if-else block can have a block
        val ret = if (age >= 18) {
            println("adult")
            "adult"
        } else if (age >= 14) {
            println("teenager")
            age
        } else {
            println("child")
            age
        }

        println(ret) // child

        // just like a ? b : c
        age = 10
        val res = if (age >= 18) "adult" else "non-adult"
        println(res)
    }
}