package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
import model.ProductVO;

public class ListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int nowPage=1;
		MockDAO dao=new MockDAO();
		ArrayList<ProductVO>list=dao.getProductList();
		System.out.println(list.toString());
		request.setAttribute("list", list);
		return "page/list.jsp";
	}

}
