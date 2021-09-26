object MapTest {
    def main(args: Array[String]): Unit = {
        // create Map
        val map: Map[String, Int] = Map("a" -> 13, "b" -> 20)
        println(map)

        // traverse
        map.foreach((kv: (String, Int)) => println(kv))
        map.foreach(kv => println(s"${kv._1} :${kv._2}"))
        
        // get keys and values
        for (key <- map.keys) {
            println(s"${key} : ${map.get(key)}")
        }

        // get value of given key
        println(map.get("a").get)
        println(map.getOrElse("c", -1)) // avoid excption
        println(map("a")) // no such key will throw exception

        // merge
        val map2 = map ++ Map("e" -> 1024)
        println(map2)
    }
}