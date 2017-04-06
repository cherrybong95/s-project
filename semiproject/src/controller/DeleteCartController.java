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
		// 나중에 세션 존재하는지 확인하고 세션 네임 확인해서 mvo에 추가하면 됨!
		HttpSession session = request.getSession(false);
		BuyerVO mvo = (BuyerVO) session.getAttribute("mvo"); // 세션으로부터
		// 회원정보를
		// 받아온다.
		if(session !=null && mvo!=null) {
			mvo.getCart().removeProduct(Integer.parseInt(pno));
			path="redirect:DispatcherServlet?command=showCartList";
		}
		return path;
	}
}
