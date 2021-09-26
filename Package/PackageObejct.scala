package object PackageObejct {
    val commonValue = "hello"
    def commonMethod(): Unit = {
        println(commonValue)
    }
}

package PackageObejct {
    object PackageObejctTest {
        def main(args: Array[String]): Unit = {
            println(commonValue)
            commonMethod()
        }
    }
}