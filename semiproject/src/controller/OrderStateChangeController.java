package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;

public class OrderStateChangeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tno=request.getParameter("tno");
		String update_state=request.getParameter("update_state");
		//System.out.println(tno+" "+update_state);
		MockDAO.getInstance().updateChange(Integer.parseInt(tno),update_state);
		return "Ajax";
	}

}
