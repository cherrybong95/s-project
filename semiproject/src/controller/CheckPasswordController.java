package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.MakerDAO;

// 비밀번호를 체크하는 컨트롤러
public class CheckPasswordController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String password = request.getParameter("password");
		String id = null;
		boolean flag = false;
		if (code.equals("1")) {
			id = request.getParameter("mid");
			flag = MakerDAO.getInstance().checkPassword(id, password);
		} else {
			id = request.getParameter("bid");
			flag = BuyerDAO.getInstance().checkPassword(id, password);
		} // code가 1이면 판매자아이디를 받아오고 1이 아니면 구매자아이디를 받아온다
		if (flag == true) {
			if (code.equals("1")) { // code가 1이면 판매자 아이디를 보낸다
				return "redirect:DispatcherServlet?command=deleteMember&code=1&id=" + request.getParameter("mid");
			} else {// code가 1이 아니면 구매자 아이디를 보낸다
				return "redirect:DispatcherServlet?command=deleteMember&code=2&id=" + request.getParameter("bid");
			}
		} else {
			return "redirect:page/deleteFail.jsp";
		}
	}

}
