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
		PrintWriter out = response.getWriter();
		//판매자 아이디에 해당하는 주문목록중에서 주문상태(pro_state)에 해당하는 목록을 반환받는다.
		ArrayList<OrderVO> orderStateList=MockDAO.getInstance().getDepositList(maker_id,pro_state);
		JSONArray ja=new JSONArray(orderStateList);
		out.print(ja.toString());
		out.close();
		return "Ajax";
	}
}
