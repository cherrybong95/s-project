package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.BuyerVO;

// 구매자 회원가입 컨트롤러
public class JoinBuyerController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("bname");
		String address = request.getParameter("add");
		String tel = request.getParameter("tel");
		// form에 입력한 정보들을 받아온다
		BuyerVO bvo = new BuyerVO(id, password, name, address, tel, "2", null);
		BuyerDAO.getInstance().joinBuyer(bvo); // form에 입력한 정보들로 회원가입 메서드를 이용해 회원가입
		HttpSession session = request.getSession();
		session.setAttribute("joinVO", bvo);
		return "redirect:page/join_ok.jsp";
	}

}