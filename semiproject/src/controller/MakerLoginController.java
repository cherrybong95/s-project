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
		if(vo==null){ //받아온 vo가 null일시 loginfail로 이동.
			return "redirect: page/loginfail.jsp";		
		}else{
		HttpSession session=request.getSession(); //login성공시 session으로 vo를 넣는다.
		session.setAttribute("mvo", vo);
		return "redirect: index.jsp";
		} 
	}

}
