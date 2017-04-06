package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberVO;
import model.MockDAO;

public class DeleteCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pno=request.getParameter("pno");
		//나중에 세션 존재하는지 확인하고 세션 네임 확인해서 mvo에 추가하면 됨!
		MemberVO mvo = MockDAO.getInstance().createMember();  //세션으로부터 회원정보를 받아온다.
		mvo.getCart().removeProduct(Integer.parseInt(pno));
		return "redirect:DispatcherServlet?command=showCartList";
	}
}
