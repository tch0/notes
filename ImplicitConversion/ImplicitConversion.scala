object  ImplicitConversion {
    def main(args: Array[String]): Unit = {
        implicit def convert(num: Int): MyRichInt = new MyRichInt(num)

        println(12.myMax(15)) // will call convert implicitly
    }
}

class MyRichInt(val self: Int) {
    // self define compare method
    def myMax(n: Int): Int = if (n < self) self else n
    def myMin(n: Int): Int = if (n > self) self else n
}