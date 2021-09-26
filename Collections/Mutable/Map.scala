import scala.collection.mutable

object MapTest {
    def main(args: Array[String]): Unit = {
        // create mutable Map
        val map: mutable.Map[String, Int] = mutable.Map("a" -> 10, "b" -> 20)

        // add element
        map.put("c", 30)
        map += (("d", 40)) // two () represent tuple to avoid ambiguity
        println(map)

        // remove element
        map.remove("a")
        map -= "b" // just need key
        println(map)

        // modify element
        map.put("c", 100) // call update, add/modify
        println(map)

        // merge Map
        map ++= Map("a" -> 10, "b" -> 20, "c" -> 30) // add and will override
        println(map)
    }
}