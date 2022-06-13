package src.camping.test;

public class TestAssignOperators {

	public static void main(String[] args) {
		int a = 100;
		
		byte b = 0; //b+(a+5.4)
		
		b += a+5.4; //b = (byte)(b+(a+5.4))
		System.out.println(b);
		
		String s = "Hello"; //s = s + " World"
		s += " World";
		System.out.println(s);
		
		int sum = 0;
		for(int i=1;i<=1000;i++) {
			sum = sum + i; //sum=sum+i;
		}
		System.out.println(sum);
	}

}
