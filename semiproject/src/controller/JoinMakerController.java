package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MakerDAO;
import model.MakerVO;

//판매자 회원가입 컨트롤러
public class JoinMakerController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String mname = request.getParameter("mname");
		String maker_bname = request.getParameter("maker_bname");
		String address = request.getParameter("add");
		String tel = request.getParameter("tel");
		String account = request.getParameter("account");
		// form에 입력한 정보들을 받아온다
		MakerVO mvo = new MakerVO(id, password, mname, maker_bname, address, tel, account, "1");
		MakerDAO.getInstance().joinMaker(mvo);// form에 입력한 정보들로 회원가입 메서드를 이용해 회원가입
		HttpSession session = request.getSession();
		session.setAttribute("joinVO", mvo);
		return "redirect:page/join_ok.jsp";
	}

}