package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
import model.ProductVO;
	//상품의 상세정보를 나타내는 컨트롤러
public class ShowProductDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="";
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		//상품번호에 해당하는 상품의 상세정보를 반환받는다.
		ProductVO pvo=MockDAO.getInstance().getProductDetail(productNo);
		//상품정보가 없으면 에러페이지
		if(pvo==null)
			url="error.jsp";
		//상품정보가 있으면 requestScope에 저장한다
		else {
			request.setAttribute("productDetail", pvo);
			//상세정보를 표시하는 페이지로 이동시킨다
			url="page/showProductDetail.jsp";
		}
		
		return url;
	}

}
