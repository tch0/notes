object PatternMatching {
    def main(args: Array[String]): Unit = {
        // basic syntax of match-case
        val x: Int = 2
        val y: String = x match {
            case 1 => "one"
            case 2 => "two"
            case 3 => "three"
            case _ => "other"
        }
        println(y)

        // simple binary operation
        val a = 20
        val b = 13

        def matchDualOp(op: Char) = op match {
            case '+' => a + b
            case '-' => a - b
            case '*' => a * b
            case '/' => a / b
            case '%' => a % b
            case _ => -1
        }

        println(matchDualOp('+'))
        println(matchDualOp('-'))
        println(matchDualOp('*'))
        println(matchDualOp('/'))
        println(matchDualOp('%'))
        println(matchDualOp('a'))

        // pattern gurad
        def abs(num: Int): Int= {
            num match {
                case i if i >= 0 => i
                case i if i < 0 => -i
            }
        }

        println(abs(10))
        println(abs(-5))
        println(abs(0))
    }
}