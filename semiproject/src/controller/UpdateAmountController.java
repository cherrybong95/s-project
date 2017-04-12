package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;

public class UpdateAmountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      PrintWriter out = response.getWriter();
	      String pno=request.getParameter("pno");
	      String amount=request.getParameter("amount");
	      
	      HttpSession session=request.getSession(false);
	      BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
	      
	      if(session !=null && mvo != null)
	         mvo.getCart().updateAmount(mvo.getBuyer_id(),Integer.parseInt(pno),Integer.parseInt(amount));

	      System.out.println("카트:"+mvo.getCart().getProductList().toString());
	      
	      //out.print();
	      out.close();
	      return "Ajax";
	}

}
