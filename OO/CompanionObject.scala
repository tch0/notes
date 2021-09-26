class CompanionObject private(val name: String) {

    def printInfo(): Unit = {
        println(s"${CompanionObject.className}")
    }
}

object CompanionObject {
    val className = "CompanionObject"
    def apply(_name: String): CompanionObject = new CompanionObject(_name)
}

object Test {
    def main(args: Array[String]): Unit = {
        val p = CompanionObject.apply("alice")
        println(p.name)
    }
}