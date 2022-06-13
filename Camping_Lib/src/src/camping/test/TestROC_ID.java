package src.camping.test;



public class TestROC_ID {

	
//	public static final String idPattern = "[A-Z][1289][0-9]{8}";
	public static boolean checkId(String id) {
		final String idPattern ="[A-Z][1289][0-9]{8}";
		if(id!=null && id.matches(idPattern)) {
			//ROC ID檢查規格
			int n[] = {10,11,12,13,14,15,16,17,34,18,19,20,21,22,35,23,24,25,26,27,28,29,32,30,31,33};
			int firstChar = n[id.charAt(0)-'A'];
			
			int sum = (firstChar/10)*1+(firstChar%10)*9;
			for(int i=1,j=8;i<9;i++,j--) {
				sum += j*Integer.parseInt(id.substring(i,i+1));
			}
				sum += (id.charAt(9)-'0')*1;
					return (sum%10==0);
		}return false;
		
		
	}
	private String id;
	public void setId(String id) {	
		if(checkId(id) && id!=null) {
			this.id=id;
		}else {
			System.err.println("帳號請輸入正確的身分證號");
//			throw new Exception("帳號請輸入正確的身分證號"+id);
		}
	}
	public String getId() {
		return id;
	}
		

}
