package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerDAO;
import model.MakerDAO;
// 판매자와 구매자를 삭제하는 컨트롤러
public class DeleteMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String id = request.getParameter("id");

		if (code.equals("1")) { // code가 1이면 판매자를 삭제한다
			boolean flag = MakerDAO.getInstance().checkProduct(id);
			System.out.println(flag);
			if (flag == false) {
				return "page/deletefail2.jsp";
			} else {
				MakerDAO.getInstance().deleteMember(id);
				HttpSession session = request.getSession();
				session.invalidate();
				return "redirect: index.jsp";
			}
		} else {// code가 1이 아니면 구매자를 삭제한다
			boolean flag = BuyerDAO.getInstance().checkProduct(id);
			System.out.println(flag);
			if (flag == false) {
				return "page/deletefail2.jsp";
			} else {
				BuyerDAO.getInstance().deleteMember(id);
				HttpSession session = request.getSession();
				session.invalidate();
				return "redirect: index.jsp";
			}

		}

	}
}