 package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.PagingBean;
import model.TransactionDTO;

public class PurchaseListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="index.jsp";
		HttpSession session=request.getSession(false);
		BuyerVO mvo=(BuyerVO)session.getAttribute("mvo");
		String nowPage =request.getParameter("pageNo");
		if(session != null && mvo !=null){
			if(nowPage==null)
				nowPage="1";
			int totalPurchaseNo=MockDAO.getInstance().getTotalPurchaseNo(mvo.getBuyer_id());  //id에 해당하는 전체 거래정보의 수를 가져온다.
			PagingBean pagingBean = new PagingBean(totalPurchaseNo,Integer.parseInt(nowPage)); //총 거래정보수와 현재페이지로 pagingbean을 setting
			//id에 따른 전체 거래정보 중에서 페이지에 해당하는 거래정보 목록만 검색하여 반환한다.
			ArrayList<TransactionDTO> tdto=MockDAO.getInstance().getTransactionInfo(mvo.getBuyer_id(),pagingBean); 
			request.setAttribute("transaction", tdto);
			request.setAttribute("pagingBean", pagingBean); 
			url="cart/purchaseView.jsp";
		}
		return url;
	}

}
