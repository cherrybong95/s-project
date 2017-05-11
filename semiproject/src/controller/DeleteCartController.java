package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;

public class DeleteCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path="index.jsp";
		String pno = request.getParameter("pno");
		HttpSession session = request.getSession(false);
		BuyerVO mvo = (BuyerVO) session.getAttribute("mvo"); 
		if(session !=null && mvo!=null) {
			mvo.getCart().removeProduct(Integer.parseInt(pno)); //선택된 상품을 장바구니에서 삭제한다.
			path="redirect:DispatcherServlet?command=showCartList";
		}
		return path;
	}
}
