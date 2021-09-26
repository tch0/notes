abstract class Person {
    // non abstract attribute
    val name: String = "person"

    // abstract attribute
    var age: Int
    val gender: String

    // non abstract method
    def eat(): Unit = {
        println("Person eat")
    }

    // abastract method
    def sleep(): Unit
}

class Student extends Person {
    override var age: Int = 18
    override val gender: String = "male"

    override def sleep(): Unit = {
        println("Student sleep")
    }
    override val name: String = "Student"
}

object AbastractClass {
    def main(args: Array[String]): Unit = {
        val p = new Student()
        
        
    }
}