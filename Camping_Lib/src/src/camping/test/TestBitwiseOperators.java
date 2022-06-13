package src.camping.test;

public class TestBitwiseOperators {

	public static void main(String[] args) {
		System.out.println(Integer.toBinaryString(~5)); //0....0000101
		
		System.out.println(Integer.toBinaryString(6 & 5)); //100
		System.out.println(6 & 5); //4
		
		System.out.println(Integer.toBinaryString(6 | 5)); //111
		System.out.println(6 | 5); //7
		
		System.out.println(Integer.toBinaryString(6 ^ 5)); //11
		System.out.println(6 ^ 5); //3
		
		System.out.println(Integer.toBinaryString(32 << 2)); //0...010_0000 << 2
		System.out.println(32 << 2); //128 0..01000_0000
		
		System.out.println(Integer.toBinaryString(32 >> 2)); //0...010
		System.out.println(32 >> 2); //8, 0..01000
		
		System.out.println(Integer.toBinaryString(-32 >> 2));//1..111
		System.out.println(-32 >> 2); //-8, 1111111_1000
		
		System.out.println(Integer.toBinaryString(-32 >>> 2));
		System.out.println(-32 >>> 2); //1073741816, 0011111_1000
	}

}
