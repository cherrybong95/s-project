package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.ListVO;
import model.MakerDAO;
import model.MockDAO;
import model.PagingBean;

public class ListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nowPage=null;
		int allMakerMember=0;
		int allBuyerMember=0;
		allMakerMember=MakerDAO.getInstance().countMakerMember();
		allBuyerMember=BuyerDAO.getInstance().countBuyerMember();
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
		//request.setAttribute("memberCountBuyer", arg1);
		request.setAttribute("MakerMember", allMakerMember);
		request.setAttribute("BuyerMember", allBuyerMember);
		return "page/list.jsp";
	}

}
