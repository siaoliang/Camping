package src.camp.view;

import java.awt.*;
import java.io.IOException;
import java.util.Random;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CaptchaServlet
 */
//@WebServlet("/camp/images/captcha.png") //url: /camp/images/captcha.jpg改到web.xml
public class CaptchaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
//    public CaptchaServlet() {
//        super();
//		  String servletName = this.getServletName(); //error code
//    }
    
	

	private int len = 6, width = 16 * 2 + 12 * len, height = 20;
	
	@Override
	public void init() throws ServletException {
		String servletName = this.getServletName();
		System.out.println(servletName + "已建立並初始化完成");
		
		String len = this.getInitParameter("len");
		if(len!=null && len.matches("\\d+")) {
			this.len = Integer.parseInt(len);
			width = 16 * 2 + 12 * this.len;
		}
	}

	private BufferedImage generateImage(String rand, int width, int height) {
        //開始建立圖片
        BufferedImage image =
                new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();   //取得影像繪圖區
 
        //畫出背景方塊
        g.setColor(getRandomColor(200, 250)); //設定繪圖區背景色
        g.fillRect(0, 0, width, height);    //在繪圖區畫個長方型

        //畫干擾線讓背景雜亂
        Random random = new Random();
        g.setColor(getRandomColor(170, 210));
        for (int i = 0; i<155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }

        //畫出認證文字
        g.setFont(new Font("Arial", Font.PLAIN, 18));//設定字體
        g.setColor(getRandomColor(20, 140));
        //將認證文字畫到image中
        g.drawString(rand, 16, 16);
        g.dispose();
        return image;
    } 

    private Color getRandomColor(int fc, int bc) {
        //在參數設定的範圍內，隨機產生顏色
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.取得FormData(無)
		
		// 2.執行商業邏輯
		Random random = new Random();
		String captcha = "";
		for(int i=0;i<len;i++) {
			int data = random.nextInt(36); //0~35: 0~9, A~Z
			char ch = (char)(data<10?data+'0':data+'A'-10);
//			System.out.println(ch); //for test
			captcha+=ch;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute(this.getServletName(), captcha);
//		System.out.println(captcha); //for test
		
		//繪製成Image
		BufferedImage image = generateImage(captcha, width, height);
		
		//3.讓圖片透過response的位元串流輸出到前端
		response.setContentType("image/png");
		try (ServletOutputStream outStream = response.getOutputStream();){      //將影像輸出到前端
            ImageIO.write(image, "JPEG", outStream);
        } 
	}

}
