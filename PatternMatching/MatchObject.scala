object MatchObject {
    def main(args: Array[String]): Unit = {
        val person = new Person("Alice", 18)

        val result: String = person match {
            case Person("Alice", 18) => "Person: Alice, 18"
            case _ => "something else"
        }
        println(result)

        val s = Student("Alice", 18)
        val result2: String = s match {
            case Student("Alice", 18) => "Student: Alice, 18"
            case _ => "something else"
        }
        println(result2)
    }
}


class Person(val name: String, val age: Int)
object Person {
    def apply(name: String, age: Int) = new Person(name, age)
    def unapply(person: Person): Option[(String, Int)] = {
        if (person == null) { // avoid null reference
            None
        } else {
            Some((person.name, person.age))
        }
    }
}

case class Student(name: String, age: Int) // name and age are val