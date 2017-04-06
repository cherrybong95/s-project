package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ListVO;
import model.MockDAO;
import model.PagingBean;
import model.ProductVO;

public class ListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nowPage=null;
		System.out.println("리스트작업 시작");

		 nowPage=request.getParameter("pageNo");
		
		if(nowPage==null)
			nowPage="1";
			System.out.println(nowPage);
		ListVO listVO=new ListVO();
		int contentNo=MockDAO.getInstance().getContentNo();
		PagingBean pagingBean=new PagingBean(contentNo,Integer.parseInt(nowPage));
		listVO=MockDAO.getInstance().getAllList(pagingBean);
		
		request.setAttribute("productListVO", listVO);
		
		
		
		return "page/list.jsp";
	}

}
