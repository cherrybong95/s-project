package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyerDAO;
import model.ListVO;
import model.MakerDAO;
import model.MockDAO;
import model.PagingBean;
//상품리스트를 메인화면에 출력하는 컨트롤러
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
		//페이징을 위한 페이징빈 객체를 생성하고 생성자에 총 상품수와 현재페이지 정보를 전달한다
		PagingBean pagingBean=new PagingBean(contentNo,Integer.parseInt(nowPage));

		//DAO 로 부터 리스트반환 메소드를 실행시킨다 페이징정보를 전달하여
		listVO=MockDAO.getInstance().getAllList(pagingBean);
		//requestScope에 리스트와 페이지정보를 저장한다
		request.setAttribute("productListVO", listVO);

		//request.setAttribute("memberCountBuyer", arg1);
		//requestScope에 판매자와 구매자 회원수를 저장한다
		request.setAttribute("MakerMember", allMakerMember);
		request.setAttribute("BuyerMember", allBuyerMember);
		return "page/list.jsp";
	}

}
