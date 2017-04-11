package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.TransactionDTO;

public class PurchaseListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="index.jsp";
		HttpSession session=request.getSession(false);
		BuyerVO mvo=(BuyerVO)session.getAttribute("mvo");
		if(session != null && mvo !=null){
			//String id=mvo.getBuyer_id();
			String id="java";
			ArrayList<TransactionDTO> tdto=MockDAO.getInstance().getTransactionInfo(id); //id의 모든 거래정보 가져오기
			//System.out.println(tdto.toString());
			request.setAttribute("transaction", tdto);
			url="cart/purchaseView.jsp";
		}
		return url;
	}

}
