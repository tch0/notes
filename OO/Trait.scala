class Person {
    val name: String = "Person"
    var age: Int = 18

    def sayHi(): Unit = {
        println(s"hello from : $name")
    }
}

trait Young {
    // abstract and non-abstract attribute
    var age: Int
    val name: String = "young"

    // method
    def play(): Unit = {
        println(s"young people $name is playing")
    }
    def dating(): Unit
}

trait Knowledge {
    var amount: Int = 0
    def increase(): Unit = {
        amount += 1
    }
}

trait Talent {
    def increase(): Unit = {
        println("increase talent")
    }
}

class Student extends Person with Young with Knowledge with Talent{
    override val name: String = "alice"

    def dating(): Unit = {
        println(s"Sutdent $name $age is dating")
    }

    def study(): Unit = println(s"Student $name is studying")

    override def sayHi(): Unit = {
        super.sayHi()
        println(s"hello from : student $name")
    }

    override def increase(): Unit = {
        super.increase() // call Talent.increase(), just the last
        println(s"studnet $name knowledge increase: $amount")
    }
}

object Trait {
    def main(args: Array[String]): Unit = {
        val s = new Student()
        s.sayHi()
        s.increase()

        s.study()
        s.increase()

        s.play()
        s.increase()

        s.dating()
        s.increase()
    }
}