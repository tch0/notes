trait Ball {
    def describe(): String = "ball"
}

trait ColorBall extends Ball {
    var color: String = "red"
    override def describe(): String = color + "_" + super.describe()
}

trait CategoryBall extends Ball {
    var category: String = "foot"
    override def describe(): String = category + "_" + super.describe()
}

// equals to MyFootBall -> ColorBall -> CategoryBall -> Ball
class MyFootBall extends CategoryBall with ColorBall {
    override def describe(): String = super.describe()
}

object TraitInheritance {
    def main(args: Array[String]): Unit = {
        val b: Ball = new MyFootBall()
        println(b.describe()) // red_foot_ball

        val c = new C()
        c.hi()
    }
}

trait A {
    def hi(): Unit = {
        println("hi A")
    }
}

trait B extends A {
    override def hi(): Unit = {
        super.hi()
        println("hi B")
    }
}

class C extends B {
    override def hi(): Unit = {
        super.hi()
    }
}