object Constructor {
    def main(args: Array[String]): Unit = {
        val p: Person = new Person("alice") // call main constructor
        p.Person() 

        val p1 = new Person()
        val p2 = new Person("bob", 25)
        p1.Person()
    }
}


class Person(private var name: String = "alice") {
    var age: Int = _
    println("call main construtor")

    def this(name: String, age: Int) = {
        this(name)
        this.age = age
        println("call assist constructor 2")
        println(s"Person: $name $age")
    }

    // just a common method, not constructor
    def Person(): Unit = {
        println("call Person.Person() method")
    }
}