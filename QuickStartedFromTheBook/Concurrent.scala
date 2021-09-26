// concurrency in scala
// actor model and messaging

// thread pool and queen pool

// example : request web page concurrently
import scala.io._
import akka.actor._ // deprecated
import Actor._

object PageLoader {
    def getpageSize(url: String): Int = Source.fromURL(url).mkString.length
}