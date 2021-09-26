object ImplicitArgments {
    def main(args: Array[String]): Unit = {
        implicit val str: String = "Alice from implicit argument"
        
        def sayHello()(implicit name: String = "Alice from default argument"): Unit = {
            println(s"hello $name")
        }

        sayHello() // implicit
        sayHello()() // default
        sayHello()("Alice from normal argument") // normal

        def sayHi(implicit name: String = "Alice from default argument"): Unit = {
            println(s"hi $name")
        }

        sayHi // implicit
        sayHi() // default
        sayHi("Alice from normal argument") // normal

        def sayBye() = {
            println(s"bye ${implicitly[String]}")
        }

        sayBye()
    }
}