class Compass {
    // the whole block is the basic constructor
    println("Outer constructor")
    val directions = List("north", "east", "south", "west")
    var bearing = 0
    println(s"initial bearing : ${direction()}")

    def direction(): String = directions(bearing)

    def inform(turnDirection : String):Unit = {
        println(s"Turning $turnDirection. Now bearing ${direction()}")
    }

    def turnRight(): Unit = {
        bearing = (bearing + 1) % directions.size
        inform("Right")
    }

    def turnLeft(): Unit = {
        bearing = (bearing + directions.size -1 ) % directions.size
        inform("Left")
    }

    // outer contructor, running after the basic constructor
    // def this() {
    //     println("Inner constructor")
    // }
}

object Compass {
    def main(args: Array[String]): Unit = {
        val myCompass = new Compass
        myCompass.turnRight()
        myCompass.turnRight()
        myCompass.turnLeft()
        myCompass.turnLeft()
        myCompass.turnLeft()
    }
}