import scala.language.postfixOps
object UserDefinedOps {
    def main(args: Array[String]): Unit = {
        val v = Vector2(10, 5)
        val v2 = Vector2(5, 10)

        println(v)
        // prefix unary
        println("==========================================")
        println(+v)
        println(-v)
        println(-(-v))
        println(-(-(+(-v))))
        println(v.unary_-("hello"))

        // binary
        println("==========================================")
        println(v * 3)
        println(v * v2)
        println(v + v2)
        println(v - v2)
        
        // postfix unary, just for test, no meaning
        println("==========================================")
        println(v-)
        println((v-)-)

        // multiple
        println("==========================================")
        println(v hello ("test", "yes"))
        println(v + (10, 10))
        println(v - (10, 10))

        // assignment operator
        println("==========================================")
        var v3 = Vector2(10, 5)
        println(v3 *= 3) // ()
        println(v3) // Vector2(30.0, 15.0)
        v3 /= 3
        println(v3)
        v3 += v2
        println(v3)
        v3 += (10, 10)
        println(v3)
    }
}

class Vector2(val x: Double, val y: Double) {
    override def toString(): String = s"Vector2($x, $y)"
    // prefix unary
    def unary_- = this.- // call postfix -
    def unary_+ = Vector2(x, y)
    def unary_-(str: String) = s"unary - with a string parameter: $str" // can not call this through operator format
    // binary
    def +(v: Vector2) = Vector2(x + v.x, y + v.y)
    def -(v: Vector2) = Vector2(x - v.x, y - v.y)
    def *(v: Vector2) = x * v.x + y * v.y // Inner product 
    def *(d: Double) = Vector2(d * x, d * y) // multiply
    def /(d: Double) = Vector2(x / d, y / d)
    // postfix unary
    def - = Vector2(-x, -y)
    // multiple
    def hello(a: String, b: String) = s"$a, $b, ${toString()}"
    def +(_x: Double, _y: Double): Vector2 = this + Vector2(_x, _y)
    def -(_x: Double, _y: Double): Vector2 = Vector2(x - _x, y - _y)
}

object Vector2 {
    def apply(x: Double, y: Double) = new Vector2(x, y)
}