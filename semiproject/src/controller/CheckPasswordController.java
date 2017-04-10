package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.MakerDAO;

public class CheckPasswordController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String password = request.getParameter("password");
		String id = null;
		boolean flag = false;
		if(code.equals("1")){
			id = request.getParameter("mid");
			flag = MakerDAO.getInstance().checkPassword(id, password);
		} else {
			id = request.getParameter("bid");
			flag = BuyerDAO.getInstance().checkPassword(id, password);
		}
		if(flag==true){
			if(code.equals("1")){
				return "redirect:DispatcherServlet?command=deleteMember&code=1&id="+request.getParameter("mid");
			} else {
				return "redirect:DispatcherServlet?command=deleteMember&code=2&id="+request.getParameter("bid");
			}
		} else {
			return "redirect:page/deleteFail.jsp";
		}
	}

}
