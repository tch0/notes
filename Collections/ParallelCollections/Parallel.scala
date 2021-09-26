// import scala.collection.immutable

// do not find parallele package
// 依赖 scala.collection.parallel 包，需要单独安装，暂未找到Jar下载途径
import scala.collection.parallel.immutable
object ParallelCollections {
    def main(args: Array[String]): Unit = {
        val result: immutable.IndexedSeq[Long] = (1 to 100).map(
            x => Thread.currentThread.getId
        )
        println(result)

        val result2 = (1 to 100).par.map(
            x => Thread.currentThread.getId
        )
        println(result2)
    }
}