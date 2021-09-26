object StringType {
    def main(args : Array[String]): Unit = {
        val name: String = "Pyrrha" + " " + "Nikos"
        val age = 17
        println((name + " ") * 3)
        printf("%s : dead in %d\n", name, age)
        print(s"$name : dead in ${age}")
        val power = 98.9072
        println(f" : power ${power}%.2f.")

        var sql = s"""
            |Select *
            |from 
            |   Student
            |Where
            |   name = ${name}
            |and
            |   age >= ${age}
        """.stripMargin // strip | and whitespaces before |
        println(sql)
    }
}