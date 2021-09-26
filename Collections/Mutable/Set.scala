import scala.collection.mutable

object SetTest {
    def main(args: Array[String]): Unit = {
        // create
        val set: mutable.Set[Int] = mutable.Set(10, 20, 30)
        println(set)

        // add element
        set += 40
        set.add(5)
        println(set)

        // remove
        set -= 40
        set.remove(5)
        println(set)

        // merge
        val set2 = set ++ Set(40, 10, 100)
        println(set2)

        set ++= Set(100, 200)
        println(set)
    }
}