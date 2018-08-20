public class FloatingPointError {

    public static void main(String[] args) {
	final double SOME_VALUE = 857.0; // THIS IS A LINE
	double oneVal = 1.0 / SOME_VALUE;
	double total = oneVal * SOME_VALUE;

	System.out.println("total should be 1.0, is actually: " + total);

	boolean areEqual = (total == 1.0);

	System.out.println("Java, are they equal? " + areEqual);
    }
}
