package src.camping.test;

import java.util.Random;
import java.util.Scanner;

public class TestGuessNumberWhile {

	public static void main(String[] args) {
		// 1. 用亂數產生1~10之間的一個數字
		Random random = new Random();
		int target = random.nextInt(10)+1; //1~10
		//System.out.println("target: "+target); //for test debug message

		// 2. 讓user從鍵盤輸入一個整數文字
//		System.out.println("請輸入1~10之間的整數: ");
		Scanner scanner = new Scanner(System.in);
		int count = 3;
		int guessNumber=0;
		
		do {
			if(count<1)break;
//			target = random.nextInt(10)+1;  //可1~10重新開始
			System.out.println(target+"請輸入1~10之間的整數(第"+ count-- + "回):");
			guessNumber = scanner.nextInt();
		}while(guessNumber!=target);
		
		if(count<=1 && guessNumber!=target) {
			System.out.println("結束");
		}else {
			System.out.println("恭喜");
		}

	}

}
