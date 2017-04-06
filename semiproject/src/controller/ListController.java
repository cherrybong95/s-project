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
		int nowPage=0;
		System.out.println("리스트작업 시작");
		//int nowPage=1;
	/*	if(request.getParameter("pageNo")!=null)
			throw new Exception();*/
		 nowPage=Integer.parseInt(request.getParameter("pageNo"));
		if(nowPage==0)
			nowPage=1;
			
		ListVO listVO=new ListVO();
		int contentNo=MockDAO.getInstance().getContentNo();
		PagingBean pagingBean=new PagingBean(contentNo,nowPage);
		listVO=MockDAO.getInstance().getAllList(pagingBean);
		
		request.setAttribute("productListVO", listVO);
		
		
		
		return "page/list.jsp";
	}

}
