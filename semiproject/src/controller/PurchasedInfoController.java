package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;
import model.TransactionDTO;

public class PurchasedInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String tno=request.getParameter("tno");
		String pno=request.getParameter("pno");
		int amount=Integer.parseInt(request.getParameter("amount"));
		ProductVO pvo=MockDAO.getInstance().findProductByNo(pno);
		
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		TransactionDTO tdto=new TransactionDTO();
		tdto.setPvo(pvo);
		tdto.setAmount(amount);
		MockDAO.getInstance().showPurchasedProduct(mvo.getBuyer_id(),tdto);
		request.setAttribute("tdto", tdto);
		System.out.println("거래완료:"+tdto.toString());
		System.out.println(((TransactionDTO)request.getAttribute("tdto")).getPvo().getPrice());
		return "cart/purchase_result.jsp";
	}

}
