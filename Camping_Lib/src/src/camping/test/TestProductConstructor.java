package src.camping.test;

import java.time.LocalDate;

import src.camping.entity.Product;

public class TestProductConstructor {

	public static void main(String[] args) {
		Product p1 = new Product(1, "透氣圓頂露營帳", 14999, 5);
//		p1.setId(0);
//		p1.setName("透氣圓頂露營帳");
//		p1.setUnitPrice(14999);
//		p1.setStock(5);
		p1.setPhotoUrl("https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MjQ2NTExLzE2Mjg2Nzc2NjlfNjk4OTE2NjI0MWQ4N2EzNDUxOWMuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=6312cfd26a19a32f");
		p1.setDescription("經典TOUGH系列最新款，搭配地墊+地布的高CP值套裝組，分離式外帳設計，內帳尺寸約300×300，提供寬敞的起居空間，主營柱為鋁合金材質，提供優異抗風性，循環透氣系統+空氣窗設計， 維持通風涼爽，可運用前庭布自由創造具個人風格的露營基地");
		p1.setShelfDate(LocalDate.now());
		
//		System.out.println("商品編號:"+ p1.getId());
//		System.out.println("name:"+ p1.getName());
//		System.out.println("unitPrice:"+ p1.getUnitPrice());
//		System.out.println("stock:"+ p1.getStock());
//		System.out.println("photoUrl:"+ p1.getPhotoUrl());
//		System.out.println("description:"+ p1.getDescription());
//		System.out.println("shelfDate:"+ p1.getShelfDate());
		
		System.out.println(p1.toString());
		
		Product p2 = new Product(2, "LED營燈", 700, 2);
//		p2.setId(0);
//		p2.setName("LED營燈");
//		p2.setUnitPrice(700);
//		p2.setStock(2);
		p2.setPhotoUrl("https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwODgyMzk1L0NNLTM1Mjg3LTJfZTFmODVhZGY4YzVhOTAzY2RhM2EuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=5a9d78bc9da25f3b");
		p2.setDescription("STOMP SERIES大自然迷彩系列，BATTERYLOCK技術，防止電源關閉後過度放電並延長電池壽命，尺寸小巧，最適合野外活動時使用，暖光系色溫，防水性能：符合IPX4（可阻擋全方向液體噴灑）");
		p2.setShelfDate(LocalDate.now());
		
//		System.out.println("id:"+ p2.getId());
//		System.out.println("name:"+ p2.getName());
//		System.out.println("unitPrice:"+ p2.getUnitPrice());
//		System.out.println("stock:"+ p2.getStock());
//		System.out.println("photoUrl:"+ p2.getPhotoUrl());
//		System.out.println("description:"+ p2.getDescription());
//		System.out.println("shelfDate:"+ p2.getShelfDate());
		
		System.out.println(p2.toString());
	}

}
