import scala.collection.mutable.ListBuffer

object ListBufferTest {
    def main(args: Array[String]): Unit = {
        val list = new ListBuffer[Int]()
        
        list.append(10)
        30 +=: 20 +=: list += 5 += 0
        println(list)

        // merge
        val list2 = ListBuffer(100)
        list2 ++= list
        println(list2)
    }
}