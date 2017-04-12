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
			int totalPurchaseNo=MockDAO.getInstance().getTotalPurchaseNo(mvo.getBuyer_id());
			PagingBean pagingBean = new PagingBean(totalPurchaseNo,Integer.parseInt(nowPage));
			ArrayList<TransactionDTO> tdto=MockDAO.getInstance().getTransactionInfo(mvo.getBuyer_id(),pagingBean); //id의 모든 거래정보 가져오기
			//System.out.println(tdto.toString());
			request.setAttribute("transaction", tdto);
			request.setAttribute("pagingBean", pagingBean);
			url="cart/purchaseView.jsp";
		}
		return url;
	}

}
