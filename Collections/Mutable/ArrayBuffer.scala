import scala.collection.mutable.ArrayBuffer

object ArrayBufferTest {
    def main(args: Array[String]): Unit = {
        // 1. create
        val arr: ArrayBuffer[Int] = new ArrayBuffer[Int]()
        val arr1: ArrayBuffer[Int] = ArrayBuffer(10, 20, 30)
        println(arr.mkString(", "))
        println(arr1) // call toString ArrayBuffer(10, 20, 30)
        
        // 2. visit
        arr1(2) = 10

        // 3. add element to tail
        var newArr = arr :+ 15 :+ 20 // do not change arr
        println(newArr)
        newArr = arr += 15 // modify arr itself, add to tail return itself, do not recommand assign to other var
        println(arr)
        println(newArr == arr) // true

        // 4. add to head
        77 +=: arr // WTF?
        println(arr)

        // 5. insert to middle
        arr.insert(1, 10)
        println(arr)

        // 6. remove element
        arr.remove(0, 1) // startIndex, count
        println(arr)
        arr -= 15 // remove specific element
        println(arr)

        // 7. convert to Array
        val newImmuArr: Array[Int] = arr.toArray
        println(newImmuArr.mkString(", "))

        // 8. Array to ArryBuffer
        val buffer: scala.collection.mutable.Buffer[Int] = newImmuArr.toBuffer
        println(buffer)
    }
}
