package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.BuyerVO;
public class BuyerLoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("Id");
		String password=request.getParameter("Password");
		BuyerVO vo=BuyerDAO.getInstance().BuyerLogin(id, password);
		if(vo==null){
			return "redirect: page/loginfail.jsp";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("mvo", vo);
			return "redirect: index.jsp";
		}
	}

}
