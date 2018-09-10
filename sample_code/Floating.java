public class Floating {

    public static void main(String[] args) {
	double oneVal = 1.0 / 857.0;
	double total = oneVal * 857.0;
	System.out.println("Should be 1.0, actually = " + total);
	boolean areEqual = (total == 1.0);
	System.out.println("Are equal? " + areEqual);
    }
}
