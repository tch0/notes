class User(val name: String, val password: String)
// user database access object
trait UserDao {
    // dependency injection from external
    _: User =>
    // insert data to databse
    def insert(): Unit = {
        println(s"insert into db: $name $password")
    }
}
// register user
class RegisterUser(name: String, password: String) extends User(name, password) with UserDao

object SelfType {
    def main(args: Array[String]): Unit = {
        val u = new RegisterUser("catholly", "nephren")
        u.insert()
    }
}