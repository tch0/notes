object Operators {
    def main(args: Array[String]): Unit = {
        // arithmetic + - * / %
        println(10 / 3)
        println(10 % 3)
        println((10 / 3.0).formatted("%.3f"))
        println((10 % 3.0).formatted("%.4f"))

        // realtional == != > < >= <=
        println(10.0 == 10.0)
        
        val s1 = "hello"
        val s2 = new String("hello")
        println(s1 == s2) // equals to call equals method in java
        println(s1.eq(s2)) // equals to == in java

        // logic
        println(true && true)
        println(true && false)
        println(false || true)
        val b: Boolean = !false
        println(b)

        // assignment = += -= *= /= %=
        var s = "hello"
        s *= 3
        println(s) 

        // bit-wise & | ^ ~
        println(0xFF & 0xFF00)
        println(0xFF | 0xFF00)
        println(~0xFFFFFF00)
        println(0xFFFF ^ 0xFF00)

        // bit shift << >> >>>
        println((0xFF << 8) + 0xFF)
        println(0XFFFF >> 8)
        println(0xFFFFFFFF >> 16) // -1
        println(0xFFFFFFFF >>> 16) // 65535

        // all operators is method call
        println(1.+(2))
    }
}