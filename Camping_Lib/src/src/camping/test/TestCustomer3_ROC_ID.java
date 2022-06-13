package src.camping.test;

import java.util.Arrays;
import java.util.Scanner;

public class TestCustomer3_ROC_ID {

	static char[] characterArray=new char[26]; //A-Z
	static int[] numberArray = {10,11,12,13,14,15,16,17,34,18,19,20,21,22,35,23,24,25,26,27,28,29,32,30,31,33}; //A-Z對應的數字
	static int[] stringToIntArray=new int[26]; //放輸入的字串
		
	public static void main(String[] args) {
		insertCharacter(); //插入英文字母	
		String inputString=getInput(); //輸入身分證字號
		check(inputString); //開始檢查
		System.out.println(inputString);	
	}
		static String getInput(){
			System.out.println("請輸入身分證字號"); //請輸入身分證字號
			Scanner sc=new Scanner(System.in);
			String idArray =sc.nextLine().toUpperCase();//無論如何轉大寫
			
			return idArray;//回傳字串
		}
		static void check(String a){
			int index=0;
			String inputString=a;//丟進來的身分證字串
			Character firstLetter= inputString.charAt(0);//抓出字串第一個英文
			for(int i=1;i<=inputString.length()-1;i++){
				stringToIntArray[i]=(int)(inputString.charAt(i))-48;//把身分證字號放入stringToIntArray[]，inputString.charAt(i)裡面的是字元1->49所以減48int 1
				
				System.out.println(stringToIntArray[i]);//偷偷檢查自己有沒有抓到
			}
			index=Arrays.binarySearch(characterArray,firstLetter);//輸入的第一個英文字母判斷她是在characterArray中的第幾個index
			int d0=numberArray[index];//對應到的數字抓出來放入d0
			int x2=(d0)%10;//d0的個位數
			int x1=(int)Math.floor((d0)/10);//d0的十位數
		
			int result=x1+(9*x2)+(8*stringToIntArray[1])+
				(7*stringToIntArray[2])+(6*stringToIntArray[3])+
				(5*stringToIntArray[4])+(4*stringToIntArray[5])+
				(3*stringToIntArray[6])+(2*stringToIntArray[7])+(stringToIntArray[8]);
			int checkCode=10-(result%10);
			
			if(stringToIntArray[9]==checkCode){
				System.out.println("身分證正確");
			}else{
				System.out.println("身分證錯誤");
			}
			
		}
		static void insertCharacter(){

			for(int i=0;i<=25;i++){
				characterArray[i]=(char) (65+i);//把英文字母放入字元陣列，強制轉型A->65
		
			}
		}
}
