package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FileManager;
import model.MakerVO;


public class FileUploadController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
			//파일 업로드하는 객체를 생성하고 생성자에 request를 전달
			FileManager fileManager = new FileManager(request);
				
	       //String simple_info=fileManager.
			//db에 파일의 정보와 이미지파일의 경로를 저장
	    		   String pno=fileManager.addProduct();
	    		   //상품 등록후 등록한 상품정보를 보여주기위해 상품번호를 url에 전달
	       return  "redirect:DispatcherServlet?command=showProductDetail&productNo="+pno;
	}

}
