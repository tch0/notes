import scala.io.StdIn

object Input {
    def main(args: Array[String]): Unit ={
        println("input name:")
        val name: String = StdIn.readLine()
        println("input age:")
        val age:Int = StdIn.readInt()
        println(name + " : " + age)
    }
}