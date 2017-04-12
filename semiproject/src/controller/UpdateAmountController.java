package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;

public class UpdateAmountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      PrintWriter out = response.getWriter();
	      String pno=request.getParameter("pno");
	      String amount=request.getParameter("amount");
	      
	      HttpSession session=request.getSession(false);
	      BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
	      int total_price=0;
	      if(session !=null && mvo != null){
	         mvo.getCart().updateAmount(mvo.getBuyer_id(),Integer.parseInt(pno),Integer.parseInt(amount));
	         total_price=mvo.getCart().getTotalPrice();
	      }
	      
	      System.out.println("카트:"+mvo.getCart().getProductList().toString());
	      
	      out.print(total_price);
	      out.close();
	      return "Ajax";
	}

}
