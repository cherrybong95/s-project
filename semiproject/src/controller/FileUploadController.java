package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FileManager;
import model.MakerVO;


public class FileUploadController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
			FileManager fileManager = new FileManager(request);
				
	       //String simple_info=fileManager.
	    		   String pno=fileManager.addProduct();
	    		   
	       return  "redirect:DispatcherServlet?command=showProductDetail&productNo="+pno;
	}

}
