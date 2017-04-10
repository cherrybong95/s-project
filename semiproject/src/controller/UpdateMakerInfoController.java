package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MakerDAO;
import model.MakerVO;

public class UpdateMakerInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String mname = request.getParameter("mname");
		String maker_bname = request.getParameter("maker_bname");
		String address = request.getParameter("add");
		String tel = request.getParameter("tel");
		String account = request.getParameter("account");
		MakerVO mvo = new MakerVO(id, password, mname, maker_bname, address, tel, account, "1");
		MakerDAO.getInstance().updateMakerInfo(mvo);
		HttpSession session = request.getSession();
		session.setAttribute("mvo", mvo);
		return "redirect:index.jsp";
	}

}
