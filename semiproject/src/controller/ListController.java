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
		int allMakerMember=0; //maker 회원수를 받아오기 위함
		int allBuyerMember=0;//buyer 회원수를 받아오기 위함
		allMakerMember=MakerDAO.getInstance().countMakerMember();
		allBuyerMember=BuyerDAO.getInstance().countBuyerMember();
		
		nowPage=request.getParameter("pageNo");
		if(nowPage==null)
			nowPage="1";
		
		ListVO listVO=new ListVO();
		//총 등록된 상품 수를 반환받는다.
		int contentNo=MockDAO.getInstance().getContentNo();
		PagingBean pagingBean=new PagingBean(contentNo,Integer.parseInt(nowPage));
		listVO=MockDAO.getInstance().getAllList(pagingBean); //page정보와 list를 반환받는다.
		request.setAttribute("productListVO", listVO);
		request.setAttribute("MakerMember", allMakerMember);
		request.setAttribute("BuyerMember", allBuyerMember);
		return "page/list.jsp";
	}

}
