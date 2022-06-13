package src.camping.test;

import java.time.LocalDate;

import src.camping.entity.Outlet;

public class TestOutlet {

	public static void main(String[] args) {
		Outlet outlet = new Outlet(2, "LED營燈", 700, 2);
		
//		outlet.setId(2);
//		outlet.setName("LED營燈");
//		outlet.setUnitPrice(700);
//		outlet.setStock(2);
		outlet.setDiscount(5);
		outlet.setPhotoUrl("https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwODgyMzk1L0NNLTM1Mjg3LTJfZTFmODVhZGY4YzVhOTAzY2RhM2EuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=5a9d78bc9da25f3b");
		outlet.setDescription("STOMP SERIES大自然迷彩系列，BATTERYLOCK技術，防止電源關閉後過度放電並延長電池壽命，尺寸小巧，最適合野外活動時使用，暖光系色溫，防水性能：符合IPX4（可阻擋全方向液體噴灑）");
		outlet.setShelfDate(LocalDate.parse("2021-10-10"));
		outlet.setDiscount(0);
		
//		System.out.println("商品編號:"+outlet.getId());
//		System.out.println("名稱:"+outlet.getName());
//		System.out.println("建議售價:"+outlet.getListPrice());
//		System.out.println("優惠價:"+outlet.getUnitPrice()); //運算式注意括號位置
//		System.out.println("庫存:"+outlet.getStock());
//		System.out.println("折扣:"+outlet.getDiscountString()); //折扣(X折)
//		System.out.println("折扣:"+outlet.getDiscount()); //折扣(% off)
//		System.out.println("圖片網址:"+outlet.getPhotoUrl());
//		System.out.println("商品介紹:"+outlet.getDescription());
//		System.out.println("上架日期:"+outlet.getShelfDate());
//		System.out.println(outlet.getDiscount());
		
		System.out.println(outlet);
	}

}
