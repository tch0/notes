object Generics {
    def main(args: Array[String]): Unit = {
        val col: MyCollection[Parent] = new MyCollection[Son]()

        // generic limit
        // upper limit
        def test[A <: Son](a: A): Unit = {
            println(a.getClass.getName())
        }

        // test[Parent](new Son()) // error
        test[GrandSon](new GrandSon())
        
        // lower limit
        def test2[A >: Son](a: A): Unit = {
            println(a.getClass.getName())
        }

        // test2[GrandSon](new GrandSon()) // error
        test2[Parent](new GrandSon())
    }
}

class Parent {}
class Son extends Parent {}
class GrandSon extends Son {}

// generic class
// +E Covariance 
// -E Contravariance
//  E Invariant
class MyCollection[+E] {
}

