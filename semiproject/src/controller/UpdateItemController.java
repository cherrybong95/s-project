package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
import model.ProductVO;

public class UpdateItemController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no=request.getParameter("no");
		System.out.println(no+11);
		ProductVO pvo=MockDAO.getInstance().findProductByNo(no);
		request.setAttribute("productVO", pvo);
		return "page/updateItem.jsp";
	}

}
