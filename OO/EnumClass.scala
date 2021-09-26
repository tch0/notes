object WorkDay extends Enumeration {
    val MONDAY = Value(1, "Monday")
    val TUESDAY = Value(2, "Tuesday")
    val THURSDAy = Value(3, "Thrusday")
}

object EnumClass {
    def main(args: Array[String]): Unit = {
        println(WorkDay.MONDAY)
        println(WorkDay.TUESDAY)
    }
}