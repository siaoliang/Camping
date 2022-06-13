package src.camping.entity;

import java.time.LocalDate;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Product {

	private int id; //必要, PKey, auto increment(>0)
	private String name; //必要, unique index, 1~30字元
	private double unitPrice; //定價, 必要, >0
	private int stock; //必要, >=0
	private String photoUrl;
	private String photoUrl2;
	private String photoUrl3;
	private String photoUrl4;
	private String photoUrl5;
	private String photoUrl6;
	private String description="";
	private LocalDate shelfDate; //需import java.time,LocalDate
	private String video;
	private String format="";
//	private int status = 1;  //0:新產品, 1:已上架, -1:已售完
	
	private Map<String, Color> colorsMap = new HashMap<>();

	//getters(accessors) for colorsMap
	public Color getColor(String colorName) {
		if(colorName==null)
			throw new IllegalArgumentException("產品顏色不得為null");
		Color color = colorsMap.get(colorName);
		//TODO:
		return color;
	}
	
	public int getColorsMapSize() {
		return colorsMap.size();
	}

	public boolean isColorsMapEmpty() {
		return colorsMap.isEmpty();
	}

	public Collection<Color> getColors() {
		return colorsMap.values();
	}

	//setters(mutators) for colorsMap: add, update, remove
	public void add(Color color) {
		if(color==null)
			throw new IllegalArgumentException("產品顏色不得為null");
		colorsMap.put(color.getName(), color);
	}
	
	
	public Product() {
		super();
	}


	public Product(int id, String name, double unitPrice) {
		//super();
		this.setId(id);
		this.setName(name);
		this.setUnitPrice(unitPrice);
		
	}
	
	
	public Product(int id, String name, double unitPrice, int stock) {
		this(id,name,unitPrice);
		this.stock = stock;
	}

	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		if(id>0) {
			this.id = id;
		}else {
			System.err.println("產品編號必須>0");
			//TODO: 第13章改成throw Exception
		}
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
			this.name = name;
	}
	
	/**
	 * 查售價(即為查定價)
	 * @return
	 */
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getPhotoUrl2() {
		return photoUrl2;
	}
	public void setPhotoUrl2(String photoUrl2) {
		this.photoUrl2 = photoUrl2;
	}
	public String getPhotoUrl3() {
		return photoUrl3;
	}
	public void setPhotoUrl3(String photoUrl3) {
		this.photoUrl3 = photoUrl3;
	}
	public String getPhotoUrl4() {
		return photoUrl4;
	}
	public void setPhotoUrl4(String photoUrl4) {
		this.photoUrl4 = photoUrl4;
	}
	public String getPhotoUrl5() {
		return photoUrl5;
	}
	public void setPhotoUrl5(String photoUrl5) {
		this.photoUrl5 = photoUrl5;
	}
	public String getPhotoUrl6() {
		return photoUrl6;
	}
	public void setPhotoUrl6(String photoUrl6) {
		this.photoUrl6 = photoUrl6;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public LocalDate getShelfDate() {
		return shelfDate;
	}
	public void setShelfDate(LocalDate shelfDate) {
		this.shelfDate = shelfDate;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}

	@Override
	public String toString() {
		return this.getClass().getSimpleName()+
				"\n 產品編號:" + id + 
				"\n 產品名稱:" + name + 
				"\n 建議售價:" + unitPrice + 
				"\n 庫存:" + stock + 
				"\n 圖片網址:" + photoUrl + 
				"\n 產品介紹:" + description + 
				"\n 上架日期:" + shelfDate +
				"\n 影片網址:" + video +
				"\n 產品規格:" + format;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
