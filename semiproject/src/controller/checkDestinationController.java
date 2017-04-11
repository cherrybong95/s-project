package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import model.BuyerVO;
import model.MockDAO;

public class checkDestinationController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("checkDestinationController실행");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");

		if(session!=null&mvo!=null){
			BuyerVO bvo=MockDAO.getInstance().getMemberInfo(mvo.getBuyer_id()); //주문하는 멤버의 정보를 불러옴
			JSONObject ja = new JSONObject();
			ja.put("buyer_name", bvo.getBuyer_name());
			ja.put("buyer_add",bvo.getBuyer_add());
			ja.put("buyer_tel", bvo.getBuyer_tel());
			out.print(ja.toString());
			System.out.println("사람:"+bvo.toString());
		}
		out.close();
		return "Ajax";
	}

}
