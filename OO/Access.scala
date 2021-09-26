package access

class Person {
    private var id = "134"
    protected var name = "alice"
    var gender = "male"
    private[access] var age = 18

    def printInfo(): Unit = {
        println(s"Person: $id $name $gender $age")
    }
}

class Student extends Person {
    // can not access id
    override def printInfo(): Unit = {
        name = "bob"
        gender = "female"
        age = 25
        println(s"Student: $name $gender $age")
    }
}

object Test {
    def main(args: Array[String]): Unit = {
        val p = new Person()
        // can not access id,name
        p.printInfo()

        val s = new Student()
        // println(s.name)
        println(s.age)
        // println(s.id)
        println(s.gender)
        s.printInfo()
    }
}