class Person(val name: String, val age: Int) {
    def hi(): Unit = {
        println(s"hi from person $name $age")
    }
}

class Student(name: String, age: Int) extends Person(name, age) {
    override def hi(): Unit = {
        println(s"hi from student $name $age")
    }
    def study(): Unit = {
        println("student study")
    }
}

object RTTI {
    def main(args: Array[String]): Unit = {
        val s: Student = new Student("alice", 18)
        s.study()
        s.hi()

        val p: Person = new Student("bob", 20)
        p.hi()

        println(s.isInstanceOf[Student])
        println(s.isInstanceOf[Person])
        println(p.isInstanceOf[Student])
        println(p.isInstanceOf[Person])

        println(p.asInstanceOf[Student])

        println(classOf[Person])
    }
}