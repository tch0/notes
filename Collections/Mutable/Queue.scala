import scala.collection.mutable
import scala.collection.immutable
object QueueTest {
    def main(args: Array[String]): Unit = {
        // mutable queue
        val queue = new mutable.Queue[String]()

        // enqueue, dequeue
        queue.enqueue("a", "b", "c")
        println(queue)

        println(queue.dequeue())
        println(queue)
        println(queue.dequeue())
        println(queue)

        // immutable queue
        val 
    }
}