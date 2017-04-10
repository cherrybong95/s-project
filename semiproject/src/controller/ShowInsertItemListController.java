package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ListVO;
import model.MockDAO;
import model.PagingBean;

public class ShowInsertItemListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nowPage=null;
		System.out.println("리스트작업 시작");
		String id = request.getParameter("id");
		 nowPage=request.getParameter("pageNo");
		 int totalContentNo=MockDAO.getInstance().getTotalContentNoById(id);
		 if(nowPage==null)
			nowPage="1";
			System.out.println(nowPage);
			
			PagingBean pagingBean=new PagingBean(totalContentNo,Integer.parseInt(nowPage));
		
		ListVO listVO = MockDAO.getInstance().findProductById(id,pagingBean);
		System.out.println("리스트 사이즈 : " + listVO.getList().size());
		request.setAttribute("productListVO", listVO);
		return "page/showInsertItem.jsp";
	}

}
