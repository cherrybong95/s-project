package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.BuyerVO;

public class UpdateBuyerInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String mname = request.getParameter("bname");
		String address = request.getParameter("add");
		String tel = request.getParameter("tel");
		BuyerVO bvo = new BuyerVO(id, password, mname, address, tel, "2", null);
		BuyerDAO.getInstance().updateBuyerInfo(bvo);
		HttpSession session = request.getSession();
		session.setAttribute("mvo", bvo);
		return "redirect:index.jsp";
	}

}
