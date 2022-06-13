package src.camping.entity;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.Objects;

import javax.print.attribute.standard.MediaSize.Other;

import src.camping.exeception.DataInvalidException;

public class Customer {

	private String id; // ROC ID, PKey,
	private String name; // required, 2~20字元
	private String email; // required,須符合email格式, unique index
	private String password; // required, 8~20字元
	private LocalDate birthday; // required,年滿12歲 ISO 8601
	private char gender; // M:男,F:女,O:其他

	private String address = "";
	private String phone = "";
	private boolean subscribed = false;
	
//	//考慮可加可不加
	//客戶血型
	private BloodType bloodType;
	public BloodType getBloodType() {
		return bloodType;
	}
	public void setBloodType(BloodType bloodType) {
		this.bloodType = bloodType;
	}
	
	public void setBloodType(String bType) {
		if(bType!=null) {
		try {
			this.setBloodType(BloodType.valueOf(bType));
		}catch(RuntimeException ex) {
			System.err.println("血型不正確");
		}
	}
	}
//	
	public Customer() {
		super();
	}

	public Customer(String id, String name, String password) {
		this.setId(id);
		this.setName(name);
		this.setPassword(password);
	}

	public Customer(String id, String name, String password, LocalDate birthday) {
		this(id, name, password);
		this.setBirthday(birthday);
	}

	public void setId(String id) {
		// if(id!=null && id.matches("[A-Z][1289]\\d{8}")){
		if (checkId(id)) {
			this.id = id;
		} else {
			System.err.println("身分證號格式不正確");
		}
	}
	public static final String IP_PATTERN="[A-Z][1289][0-9]{8}";
	public static boolean checkId(String id) {
		if(id!=null && id.matches(IP_PATTERN)) {
			//1.將第1碼英文轉成對應的數字
			char first = id.charAt(0);
			int number = -1;
			if(first>='A' && first<='H') {
				number = first-'A'+10;
			}else if(first>='J' && first<='N') {
				number = first-'J'+18;
			}else if(first>='P' && first<='V') {
				number = first-'P'+23;
			}else if(first=='X') {
				number = 30;
			}else if(first=='Y') {
				number = 31;
			}else if(first=='W') {
				number = 32;
			}else if(first=='Z') {
				number = 33;
			}else if(first=='I') {
				number = 34;
			}else if(first=='O') {
				number = 35;
			}else	{
				return false;
			}
//				switch(first) {
//					case'X':number=30;break;
//					case'Y':number=31;break;
//					case'W':number=32;break;
//					case'Z':number=33;break;
//					case'I':number=34;break;
//					case'O':number=35;break;
//					default: return false;
//				}
			
			//TODO: J(18)-N(22),P(23)-V(29),X,Y,W,Z,I,O
			int sum = number/10 + number%10*9;
			//2.將各個數字字元依公式加總
			for(int i=1,j=8;i<9;i++,j--) {
				sum = sum + (id.charAt(i)-'0')*j; //(j=0?:j=1)
			}
//			sum = sum + (id.charAt(2)-'0')*7;
//			sum = sum + (id.charAt(3)-'0')*6;
//			sum = sum + (id.charAt(4)-'0')*5;
//			sum = sum + (id.charAt(5)-'0')*4;
//			sum = sum + (id.charAt(6)-'0')*3;
//			sum = sum + (id.charAt(7)-'0')*2;
//			sum = sum + (id.charAt(8)-'0')*1;
			
			sum = sum + (id.charAt(9)-'0')*1;
			
			//3.當sum%10==0即為正確的ROC ID
			return (sum%10==0);
			//}
		}
		return false; //不符合格式
	}

	public String getId() {
		return this.id;
	}

	public String getName() {
		return name;
	}
	
	public static final int MINLENGTH_PATTERN1=2;
	public static final int MAXLENGTH_PATTERN1=10;
	public void setName(String name) {
		if (name != null && (name = name.trim()).length() >= MINLENGTH_PATTERN1 && name.length() <= MAXLENGTH_PATTERN1) {
			this.name = name;
		} else {
//			System.err.printf("客戶姓名必須輸入且長度在%d~%d之間",MINLENGTH_PATTERN1,MAXLENGTH_PATTERN1);
			String msg = String.format("客戶姓名必須輸入且長度在%d~%d之間", MINLENGTH_PATTERN1,MAXLENGTH_PATTERN1);
			throw new DataInvalidException(msg);
		}
	}

	public String getEmail() {
		return email;
	}
	
	public static final String EMAIL_PATTERN="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
	public void setEmail(String email) {
		if (email != null && email.matches(EMAIL_PATTERN)) {
			this.email = email;
		} else {
//			System.out.println("email必須輸入取符合格式");
			String msg = String.format("email必須輸入取符合格式");
			throw new DataInvalidException(msg);
		}

	}

	public String getPassword() {
		return password;
	}
	
	public static final int MINLENGTH_PATTERN=8;
	public static final int MAXLENGTH_PATTERN=20;
	public void setPassword(String password) {
		if (password != null && password.length() >= MINLENGTH_PATTERN && password.length() <= MAXLENGTH_PATTERN) {
			this.password = password;
		} else {
//			System.err.printf("密碼必須輸入且長度在%d~%d之間",MINLENGTH_PATTERN,MAXLENGTH_PATTERN);
			String msg = String.format("密碼必須輸入且長度在%d~%d之間", MINLENGTH_PATTERN,MAXLENGTH_PATTERN);
			throw new DataInvalidException(msg);
		}
	}
	
	/**
	 * 計算客戶年齡
	 * 
	 * @return int型態的客戶年齡
	 */
	public int getAge() {
		return getAge(this.birthday);
	}

	/**
	 * 計算指定生日birthday的年齡
	 * @param birthday:指定生日birthday
	 * @return int型態的客戶年齡
	 */
	public static int getAge(LocalDate birthday) {
		int thisYear = LocalDate.now().getYear();
		if (birthday != null) {
//			int birthYear = birthday.getYear();
//			int age = thisYear - birthYear;
//			System.out.println(
//					Period.between(birthday, LocalDate.now())); //for test
			int age = Period.between(birthday, LocalDate.now()).getYears();
			return age;
		} else {
			return -1;
			// TODO:第13章 改(拋出)throw exception物件
		}
	}

	public LocalDate getBirthday() {
		return birthday;
	}
	
	//若birthday使用java.util.Date型態來宣告
//	public void setBirthday(java.util.Date date) {
//		this.birthday = date;
//	}
	
	public void setBirthday(String date) {
		try {
			this.setBirthday(LocalDate.parse(date)); //字串須符合ISO-8601
		}catch(DateTimeParseException e) {
			String msg = String.format("日期格式不符合iso-8601: yyyy-MM-dd", date);
			throw new DataInvalidException(msg);
		}
	}
		

	public void setBirthday(int year, int month, int day) {
		try {
			this.setBirthday(LocalDate.of(year, month, day));
		}catch(java.time.DateTimeException ex) {
			throw new DataInvalidException("日期資料不正確:"+ex.getMessage());
		}

	}
	
	public static final int MIN_AGE = 12;
	public void setBirthday(LocalDate birthday) {
		if (birthday != null && getAge(birthday) >= MIN_AGE) {
			this.birthday = birthday;
		} else {
//			System.err.printf("客戶生日必須輸入取年滿%d歲",MIN_AGE);
			String msg = String.format("客戶生日必須輸入取年滿%d歲", MIN_AGE);
			throw new DataInvalidException(msg);
		}
	}

	public char getGender() {
		return gender;
	}
	
	public static final char MALE='M';
	public static final char FEMALE='F';
	public static final char OTHER='O';
	public void setGender(char gender) {
		if (gender == MALE || gender == FEMALE || gender == OTHER) {
			this.gender = gender;
		} else {
//			System.err.printf("請輸入性別資料,男:%s,女:%s,其他:%s",MALE,FEMALE,OTHER);
			String msg = String.format("請輸入性別資料,男:%s,女:%s,其他:%s", MALE,FEMALE,OTHER);
			throw new DataInvalidException(msg);
		}
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
//		if (address != null && address.length() > 0) {
//			address = address.trim();
//		} else if(address==null) {
//			System.err.println("請輸入正確地址格式");
//		}
	}

	public String getPhone() {
//		if(phone!=null && phone.length()>0) {
//			phone = phone.trim();
//		}
		return phone;
	}
	
	public static final int MINLENGTH_PATTERN2=10;
	public static final int MAXLENGTH_PATTERN2=15;
	public void setPhone(String phone) {
		if (phone != null && 
				phone.length() >= MINLENGTH_PATTERN2 && phone.length() <= MAXLENGTH_PATTERN2) {
		this.phone = phone;
	} else {
//		System.err.printf("手機格式不正確");
		String msg = String.format("手機格式不正確", MINLENGTH_PATTERN2,MAXLENGTH_PATTERN2);
		throw new DataInvalidException(msg);
	}
}

	public boolean isSubscribed() {
		return subscribed;
	}

	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName()+
				"\n ID:" + id + 
				"\n 姓名:" + name + 
				"\n e-mail:" + email + 
				"\n 密碼:" + password + 
				"\n 生日:" + birthday + "("+getAge()+"歲)" +
				"\n 性別:" + gender + 
				"\n 地址:" + address + 
				"\n 電話:" + phone + 
				"\n 訂閱電子報:" + subscribed;

	}



	@Override
	public int hashCode() {
		return Objects.hash(id, name);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Customer))
			return false;
		Customer other = (Customer) obj;
		return Objects.equals(id, other.id) && Objects.equals(name, other.name);
	}	
	
	
	
	
//	@Override
//	public int hashCode() {
////		int hash = this.id!=null?id.hashCode():0;
////		hash = hash*31 + name!=null?name.hashCode():0;
////		hash *= hash*31 + gender;
//		return this.id!=null?id.hashCode():0;
//	}
//
//
//
//	@Override
//	public boolean equals(Object obj) {
//		if(this==obj) return true;
//
////		if(id!=null && this.getClass()==obj.getClass()) {
//		if(obj instanceof Customer) {
//			Customer other = (Customer)obj;
//			if(id!=null && this.id.equals(other.id)) {
////					&& name!=null && name.equals(other.name)
////					&& gender==other.gender		
//				return true;
//			}
////			else if(id==null && other.id==null);
////			return true;
//		}
//		return false;
//	}
	

}
