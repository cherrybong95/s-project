package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MakerVO;
import model.MockDAO;

public class DeleteItemController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no=Integer.parseInt(request.getParameter("no"));
		MockDAO.getInstance().deleteProduct(no);

				HttpSession session=request.getSession();
				
				MakerVO mvo=(MakerVO)session.getAttribute("mvo");
				String id=mvo.getMaker_id();
		return "redirect:DispatcherServlet?command=showInsertItem&id="+id;
	}

}
