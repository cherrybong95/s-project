package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;

public class CheckCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String pno=request.getParameter("pno"); 
		HttpSession session = request.getSession(false);
		BuyerVO mvo = (BuyerVO) session.getAttribute("mvo"); // 세션으로부터
		// 회원정보를
		// 받아온다.
		int index=-1;
		if(session !=null && mvo!=null) {
			index=mvo.getCart().findIndexByNo(Integer.parseInt(pno)); //카트에 있는지 없는지 검사한다.

		}
		System.out.println("check index"+index);
		out.print(index);
		out.close();
		return "Ajax";
	}
}
