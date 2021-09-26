public class ExceptionsTest {
    public static void main(String[] args) {
        try {
            int a = 0;
            int b = 0;
            int c = a / b;
        } catch (ArithmeticException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("finally");
        }
    }
}