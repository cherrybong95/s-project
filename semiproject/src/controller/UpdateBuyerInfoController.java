package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.BuyerVO;
// 구매자의 회원정보를 수정하는 컨트롤러
public class UpdateBuyerInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String mname = request.getParameter("bname");
		String address = request.getParameter("add");
		String tel = request.getParameter("tel");
		// 회원정보수정 form에서 정보를 받아온다
		BuyerVO bvo = new BuyerVO(id, password, mname, address, tel, "2", null);
		BuyerDAO.getInstance().updateBuyerInfo(bvo);// 회원정보 수정하는 메서드로 회원정보를 수정
		HttpSession session = request.getSession();
		session.setAttribute("mvo", bvo);
		return "redirect:index.jsp";
	}

}
