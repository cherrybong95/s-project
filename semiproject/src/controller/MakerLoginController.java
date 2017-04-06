package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MakerDAO;
import model.MakerVO;

public class MakerLoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("Id");
		String password=request.getParameter("Password");
		MakerVO vo=MakerDAO.getInstance().MakerLogin(id, password);
		if(vo==null){
			return "redirect: page/loginfail.jsp";		
		}else{
		HttpSession session=request.getSession();
		session.setAttribute("mvo", vo);
		return "redirect: index.jsp";
		} 
	}

}
