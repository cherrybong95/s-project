package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MakerVO;
import model.MockDAO;
import model.ProductVO;

public class ProductUpdateController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pno=Integer.parseInt(request.getParameter("pno"));
		String pname=request.getParameter("pname");
		int price=Integer.parseInt(request.getParameter("price"));
		int total_amount=Integer.parseInt(request.getParameter("total_amount"));
		String simple_info=request.getParameter("simple_info");
		String detail_info=request.getParameter("detail_info");
		System.out.println(pno);
		ProductVO pvo=new ProductVO();
		pvo.setPno(pno);
		pvo.setPname(pname);
		pvo.setPrice(price);
		pvo.setTotal_amount(total_amount);
		pvo.setSimple_info(simple_info);
		pvo.setDetail_info(detail_info);
		
		MockDAO.getInstance().updateProduct(pvo);
	
		HttpSession session=request.getSession();
		MakerVO mvo=(MakerVO)session.getAttribute("mvo");
		String id=mvo.getMaker_id();
		return "redirect:DispatcherServlet?command=showInsertItem&id="+id;
				
	}

}
