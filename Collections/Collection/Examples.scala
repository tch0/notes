import scala.collection.mutable
object CalculationExamples {
    def main(args: Array[String]): Unit = {
        // mergeMap()
        // wordCount()
        wordCountAdvanced()
        wordCountAdvanced2()
    }

    // 1
    def mergeMap(): Unit = {
        // merging two Map will override the value of the same key
        // custom the merging process instead of just override
        val map1 = Map("a" -> 1, "b" -> 3, "c" -> 4)
        val map2 = mutable.Map("a" -> 6, "b" -> 2, "c" -> 5, "d" -> 10)

        val map3 = map1.foldLeft(map2)(
            (mergedMap, kv) => {
                mergedMap(kv._1) = mergedMap.getOrElse(kv._1, 0) + kv._2
                mergedMap
            }
        )
        println(map3) // HashMap(a -> 7, b -> 5, c -> 9, d -> 10)
    }

    // 2. count words in string list, and get high frequency 3 words 
    def wordCount(): Unit = {
        val stringList: List[String] = List(
            "hello",
            "hello world",
            "hello scala",
            "hello spark from scala",
            "hello flink from scala"
        )

        // 1. split
        val wordList: List[String] = stringList.flatMap(_.split(" "))
        println(wordList)

        // 2. group same words
        val groupMap: Map[String, List[String]] = wordList.groupBy(word => word)
        println(groupMap)

        // 3. get length of the every word, to (word, length)
        val countMap: Map[String, Int] = groupMap.map(kv => (kv._1, kv._2.length))

        // 4. convert map to list and sort
        val countList: List[(String, Int)] = countMap.toList
            .sortWith(_._2 > _._2)
            .take(3)

        println(countList) // result
    }

    // 3. strings has their frequency
    def wordCountAdvanced(): Unit = {
        val tupleList: List[(String, Int)] = List(
            ("hello", 1),
            ("hello world", 2),
            ("hello scala", 3),
            ("hello spark from scala", 1),
            ("hello flink from scala", 2)
        )

        val newStringList: List[String] = tupleList.map(
            kv => (kv._1.trim + " ") * kv._2
        )

        // just like wordCount
        val wordCountList: List[(String, Int)] = newStringList
            .flatMap(_.split(" "))
            .groupBy(word => word)
            .map(kv => (kv._1, kv._2.length))
            .toList
            .sortWith(_._2 > _._2)
            .take(3)
        
        println(wordCountList) // result
    }

    // 4. base on the frequency
    def wordCountAdvanced2(): Unit = {
        val tupleList: List[(String, Int)] = List(
            ("hello", 1),
            ("hello world", 2),
            ("hello scala", 3),
            ("hello spark from scala", 1),
            ("hello flink from scala", 2)
        )

        // first split based on the input frequency
        val preCountList: List[(String, Int)] = tupleList.flatMap(
            tuple => {
                val strings: Array[String] = tuple._1.split(" ")
                strings.map(word => (word, tuple._2)) // Array[(String, Int)]
            }
        )

        // group as words
        val groupedMap: Map[String, List[(String, Int)]] = preCountList.groupBy(_._1)
        println(groupedMap)

        // count frequency of all words
        val countMap: Map[String, Int] = groupedMap.map(
            kv => (kv._1, kv._2.map(_._2).sum)
        )
        println(countMap)

        // to list, sort and take first 3 words
        val countList = countMap.toList.sortWith(_._2 > _._2).take(3)
        println(countList) // result
    }
}