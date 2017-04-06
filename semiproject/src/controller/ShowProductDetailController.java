package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
import model.ProductVO;

public class ShowProductDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="";
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		ProductVO pvo=MockDAO.getInstance().getProductDetail(productNo);
		if(pvo==null)
			url="error.jsp";
		else {
			request.setAttribute("productDetail", pvo);
			url="page/showProductDetail.jsp";
		}
		
		return url;
	}

}
