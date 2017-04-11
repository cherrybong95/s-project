package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.MockDAO;
import model.OrderVO;

public class ShowOrderStateListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String pro_state=request.getParameter("pro_state");
		String maker_id=request.getParameter("maker_id");
		System.out.println(pro_state);
		PrintWriter out = response.getWriter();
		ArrayList<OrderVO> orderStateList=MockDAO.getInstance().getDepositList(maker_id,pro_state);
		System.out.println(orderStateList);
		JSONArray ja=new JSONArray(orderStateList);
		out.print(ja.toString());
		out.close();
		return "Ajax";
	}

}
