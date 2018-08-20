import java.math.BigInteger;

public class Laboon {
    public static int laboonify(String l) {
	char[] chars = l.toCharArray();
	BigInteger counter = new BigInteger("0");
    
	for (int j = 0; j < chars.length; j++) {
	    BigInteger x = new BigInteger(Integer.toString((int) chars[j]));
	    BigInteger toAdd = x.pow(10).add(x.pow(8)).subtract(x.pow(3).add(x.pow(2)));
	    counter = counter.add(toAdd);
	    
	}
	return counter.mod(new BigInteger("65536")).intValue();
	
    }

    public static void main(String[] args) {
	if (args == null || args.length == 0) {
	    System.err.println("Enter a string");
	    System.exit(1);
	}

	String j = String.join(" ", args);
	int result = laboonify(j);
	System.out.println(String.format("%x", result));

    
    }
}
