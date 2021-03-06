package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.DeliveryVO;
import model.MockDAO;
import model.TransactionDTO;

public class TransactionDetailInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="index.jsp";
		String tno=request.getParameter("tno");
	      HttpSession session=request.getSession(false);
	      BuyerVO mvo = (BuyerVO) session.getAttribute("mvo");
	      if(session !=null && mvo!=null){
	    	  //거래번호에 해당하는 거래정보(상품정보 포함)를 반환받는다.
	    	  TransactionDTO tdto=MockDAO.getInstance().findTransactionInfoByTno(Integer.parseInt(tno));
	    	  //거래번호에 해당하는 배송정보를 반환받는다.
	    	  DeliveryVO dvo = MockDAO.getInstance().findDeliveryInfoByTno(Integer.parseInt(tno));
	    	  request.setAttribute("tdto", tdto);
	    	  request.setAttribute("dvo", dvo);
	    	  url="cart/transactionDetailInfo.jsp";
	      }
		return url;
	}

}
