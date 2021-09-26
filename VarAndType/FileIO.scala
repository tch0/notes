import scala.io.Source
import java.io.PrintWriter
import java.io.File
object FileIO {
    def main(args: Array[String]): Unit ={
        // read from file
        Source.fromFile("FileIO.txt").foreach(print)

        // write to file
        // call java API to write
        val writer = new PrintWriter(new java.io.File("WFile.txt"))
        writer.write("Nephren!")
        writer.close()
    }
}