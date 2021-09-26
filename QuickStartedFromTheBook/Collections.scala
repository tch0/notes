import scala.collection.mutable.HashMap
object CollectionsTest {
    def main(args: Array[String]): Unit = {
        // list
        val l = List(1, 2, 3, "hello") // List[Any]
        println(l(1))
        println(l(l.size - 1))
        println(Nil) // empty list

        // set, no order
        var animals = Set("rabbit", "monkey", "bear")
        animals += "elephant" // with no destrction, will create a new set
        println(animals)

        // union ++
        // subtraction --
        // Intersection & (** deprecated)
        animals = animals ++ Set("lion", "tiger")
        println(animals)
        animals = animals -- Set("lion", "tiger")
        println(animals)
        animals = animals & Set("rabbit", "monkey", "bear")
        println(animals) // HashSet(bear, monkey, rabbit)
        println(animals == Set("rabbit", "monkey", "bear")) // true

        // map
        val dict = Map(0 -> "zero", 1 -> "one", 2 -> "two") // Syntactic sugar 
        println(dict)
        val m = new HashMap[Int, String]
        m += 1 -> "one"
        m += 4 -> "four"
        println(m)
    }
}