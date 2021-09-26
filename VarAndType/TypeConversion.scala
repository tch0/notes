object TypeConversion {
    def main(arg : Array[String]) : Unit = {
        var b: Byte = 65
        println(b.toChar) // A
        println('a'.toInt) // 97
        println(2.7.toInt) // 2 
        println(-2.5.toInt) // -2

        println("12.3".toFloat) // 12.3
        println("13.4".toDouble.toInt) // 13.4

        println('a' * 3)
    }
}