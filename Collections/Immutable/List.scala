object ListTest {
    def main(args: Array[String]): Unit = {
        // create List
        val list = List(10, 20)
        println(list(1))

        list.foreach(elem => print(s"$elem "))
        println()

        // :: method of List abstract class
        val list2 = list.::(30) // add to head
        println(list2)

        // new list
        val list3 = 30 :: 20 :: 19 :: Nil
        println(list3)

        // add list to list as a element
        val list4 = list2 :: list3
        println(list4) // List(List(30, 10, 20), 30, 20, 19)

        // concatenate two list
        val list5 = list2 ::: list3 ++ list2
        println(list5)
    }
}