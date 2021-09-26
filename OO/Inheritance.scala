class Person {
    var name: String = _
    var age: Int = _

    println("call main constructor of Person")

    def this(name: String, age: Int) = {
        this()
        println("call assist constructor 1 of Person")
        this.name = name
        this.age = age
    }

    def printInfo(): Unit = {
        println(s"Person: $name $age")
    }
}

class Student extends Person {
    var id: String = _
    println("call main constructor of Student")

    def this (name: String, age: Int, id: String) = {
        this()
        this.name = name
        this.age = age
        this.id = id
        println("call assist constructor 1 of Student")
    }

    override def printInfo(): Unit = {
        println(s"Student: $name $age $id")
    }
}

object Inheritance {
    def main(args: Array[String]): Unit = {
        val s = new Student("alice", 20, "std001")
        s.printInfo()
    }
}