package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.MakerDAO;

public class DeleteMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		if(code.equals("1")){
			MakerDAO.getInstance().deleteMember(id);
		} else {
			BuyerDAO.getInstance().deleteMember(id);
		}
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect: index.jsp";
	}

}
